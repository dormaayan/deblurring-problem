function [ reconstructed_image ] = hevc_bpg_image_compression_decompression( image_y, compression_QP)

temp_number = 2; %randi(1000,1);

temp_input_filename = sprintf( '/Users/Dor/Desktop/VideoProcessinProject/input%d.png', temp_number );
imwrite( uint8(image_y), temp_input_filename );

%temp_reconstructed_filename = sprintf( 'Y:\\bpg\\output%d.png', temp_number );
compressed_file = sprintf( '/Users/Dor/Desktop/VideoProcessinProject/compressed%d', temp_number );
temp_reconstructed_filename = sprintf( '/Users/Dor/Desktop/VideoProcessinProject/output%d.png', temp_number );

encoderDirectory = '/usr/local/Cellar/libbpg/0.9.8/bin'; 
[dontcare1, dontcare2] = system( sprintf('%s/bpgenc -q %d -o %s  %s', encoderDirectory, compression_QP, compressed_file, temp_input_filename ) );
[dontcare1, dontcare2] = system( sprintf('%s/bpgdec -o %s  %s', encoderDirectory, temp_reconstructed_filename, compressed_file ) );

system( sprintf( 'rm %s', temp_input_filename ) );
system( sprintf( 'rm %s', compressed_file ) );

reconstructed_image = imread( temp_reconstructed_filename );
reconstructed_image = double(reconstructed_image(:,:,1));
system( sprintf( 'rm %s', temp_reconstructed_filename ) );

end

