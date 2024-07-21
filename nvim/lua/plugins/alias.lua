return {
    "konfekt/vim-alias",
    config = function() 
        vim.cmd [[Alias cprun exec\ '!g++\ %\ -std=c++17\ -o\ cpbin\ -Wall\ -DLOCAL\ -O2\ &&\ time\ ./cpbin']]
    end
}
