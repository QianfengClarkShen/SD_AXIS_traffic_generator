#include "host2fpga_datamover.h"
#include "bin_reader.h"

class DATA_HANDLER {
public:
	int init(const char* inFilePath, AXIL_CONTROLLER * controller, u64 offset);
	int move_data();
	u64 page_num;
	u64 actual_size;
	u64 packet_num;
private:
	u64 hw_offset;
	HOST2FPGA_DATAMOVER data_mover;
	BIN_READER bin_reader;
};
