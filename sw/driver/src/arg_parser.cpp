#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include "arg_parser.h"
using namespace std;

void ARG_PARSER::print_usage() {
	cout << "usage : traffic_gen [-n <iter_num>] [-o <offset>] <traffic.bin>" << endl << endl;
	cout << "available options are :" << endl << endl;
	cout << "positional arguments :" << endl;
	cout << "<traffic.bin>\ttraffic input in binary format" << endl << endl;
	cout << "optional arguments :" << endl;
	cout << "-h, --help\t\tshow this help message and exit" << endl;
	cout << "-n, --iter_num <int>\tset how many iterations the test should repeat" << endl;
	cout << "-o, --offset <int>\tthe traffic data would be put into FPGA memory, this set the offset address for FPGA memory." << endl;
	cout << "-s, --simple_mode \texclude the loopback module" << endl;
}

int ARG_PARSER::parse(int argc, char** argv) {
	iter_num = 1;
	offset = 0;
	simple_mode = 0;
	string suffix(".bin");
	string filePath;

	string arg;

	int i = 1;
	while (i < argc-1) {
		arg = string(argv[i]);
		if (arg.compare(string("-h")) == 0 || filePath.compare(string("--help")) == 0) {
			print_usage();
			return 1;
		} else if (arg.compare(string("-n")) == 0 || arg.compare(string("--iter_num")) == 0) {
			iter_num = stoi(argv[i+1]);
			if (iter_num < 0) {
				cout << "Error: iteration num should be greater than or equal to 0" << endl << endl;
				return 1;
			}
			i=i+2;
		} else if (arg.compare(string("--offset")) == 0 || arg.compare(string("-o")) == 0) {
			offset = stoi(argv[i+1]);
			if (offset < 0) {
				cout << "Error: offset should be greater than or equal to 0" << endl << endl;
				return 1;
			}
			i=i+2;
		} else if (arg.compare(string("--simple_mode")) == 0 || arg.compare(string("-s")) == 0) {
			simple_mode = 1;
			i++;
		}
	}

	filePath = string(argv[argc-1]);

	if (filePath.size() <= suffix.size() || filePath.compare(filePath.size()-suffix.size(), suffix.size(), suffix) != 0) {
		cout << "ERROR input file suffix! should be a .bin file" << endl << endl;
		print_usage();
		return 1;
	} else {
		inFilePath = argv[argc-1];
	}

	return 0;
}
