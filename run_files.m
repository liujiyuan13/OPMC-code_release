clc
clear

prefix = 'D:/Work/OMCMF-code/';
data_path = 'D:/Work/datasets/mData/Fmatrix/';

addpath(genpath([prefix, 'eval/']));
addpath(genpath([prefix, 'obj_final/']));

data_names = {'Mfeat_fea', 'NUS-WIDE-OBJECT_fea', 'CCV_fea', 'SUNRGBD_fea', 'AwA_fea', 'Flower17_fea', 'Wiki_fea', 'BDGP_fea', 'MNIST_fea', 'YoutubeFace_sel_fea', 'YoutubeFace_sel_fea.bak', 'Caltech101-7_fea', 'Caltech101-20_fea', 'Caltech101-all_fea'};
iters = {[1:100], [1:100], [1:100], [1:100], [1:100], [1:100], [1:100], [1:100], [1:100], [1:100] , [1:100], [1:100], [1:100], [1:100]};

data_names = {'CoverType_fea'};
iters = {[1:10]};

data_names = {'Corel_fea'};
iters = {[1:10]};

for id=1
    data_name = data_names{id};
    fprintf('\ndata_name: %s', data_name);
    save_path = [prefix, 'res/'];
    [~] = mydemo_fun( data_path, data_name, save_path, iters{id} );
end


% for id=14
%     data_name = data_names{id};
%     fprintf('\ndata_name: %s', data_name);
%     save_path = [prefix, 'res/single_view/'];
%     [~] = mydemo_fun_b_c( data_path, data_name, save_path, iters{id} );
% end

% for id = 14
%     data_name = data_names{id};
%     fprintf('\ndata_name: %s', data_name);
%     save_path = [prefix, 'res/'];
%     [~] = mydemo_fun_verbose( data_path, data_name, save_path );
% end