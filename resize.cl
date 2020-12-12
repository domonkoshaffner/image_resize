__kernel void resize(read_only image2d_t orig_im, write_only image2d_t new_im, sampler_t grid_sampler, 
                        int width, int height, int new_width, int new_height) 
{

// Saving the global ids in variables

    int i = get_global_id(0);
    int j = get_global_id(1);

// Calculating the new coordinates

    int new_x = round(width*i/new_width);
    int new_y = round(height*j/new_height);

// Creating the 2D image objects
// Saving the original coordinates in the new ones

    float4 pixel = read_imagef(orig_im, grid_sampler, (int2)(new_x,new_y));
    write_imagef(new_im, (int2)(i,j), pixel);
    

}
