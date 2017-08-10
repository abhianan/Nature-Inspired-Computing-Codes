function varargout = GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = GUI_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;

function checkbox1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox1

function checkbox2_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox2

function checkbox3_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox3

function checkbox4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox4

function checkbox5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox5

function checkbox6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox6

function checkbox7_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox7

function checkbox8_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox8

function checkbox9_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox9

function checkbox10_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox10

function checkbox11_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox11

function checkbox12_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox12

function checkbox13_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox13

function checkbox14_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox14

function checkbox15_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox15

function checkbox16_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox16

function checkbox17_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox17

function checkbox18_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox18

function checkbox19_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox19

function checkbox20_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox20

function checkbox21_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox21

function checkbox22_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox22

function checkbox23_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox23

function checkbox24_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox24

function checkbox25_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox25

function checkbox26_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox26

function checkbox27_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox27

function checkbox28_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox28

function checkbox29_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox29

function checkbox30_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox30

function pushbutton2_Callback(hObject, eventdata, handles)
load ('map.mat');
axes(handles.TSP);
scatter(a(:,1), a(:,2), 'filled');
axis([0 100 0 100]);
labels = num2str((1:size(a,1))','%d');
text(a(:,1), a(:,2), labels, 'horizontal','left', 'vertical','bottom');


function [] = drawLine(p1, p2)
theta = atan2( p2(2) - p1(2), p2(1) - p1(1));
r = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2);
line = 0:0.01: r;
x = p1(1) + line*cos(theta);
y = p1(2) + line*sin(theta);
plot(x, y)

function pushbutton3_Callback(hObject, eventdata, handles)

load ('map.mat');
num_checkbox=30;
check_val=zeros(1,num_checkbox);
check_val(1) = get(handles.checkbox1, 'Value');
check_val(2) = get(handles.checkbox2, 'Value');
check_val(3) = get(handles.checkbox3, 'Value');
check_val(4) = get(handles.checkbox4, 'Value');
check_val(5) = get(handles.checkbox5, 'Value');
check_val(6) = get(handles.checkbox6, 'Value');
check_val(7) = get(handles.checkbox7, 'Value');
check_val(8) = get(handles.checkbox8, 'Value');
check_val(9) = get(handles.checkbox9, 'Value');
check_val(10) = get(handles.checkbox10, 'Value');
check_val(11) = get(handles.checkbox11, 'Value');
check_val(12) = get(handles.checkbox12, 'Value');
check_val(13) = get(handles.checkbox13, 'Value');
check_val(14) = get(handles.checkbox14, 'Value');
check_val(15) = get(handles.checkbox15, 'Value');
check_val(16) = get(handles.checkbox16, 'Value');
check_val(17) = get(handles.checkbox17, 'Value');
check_val(18) = get(handles.checkbox18, 'Value');
check_val(19) = get(handles.checkbox19, 'Value');
check_val(20) = get(handles.checkbox20, 'Value');
check_val(21) = get(handles.checkbox21, 'Value');
check_val(22) = get(handles.checkbox22, 'Value');
check_val(23) = get(handles.checkbox23, 'Value');
check_val(24) = get(handles.checkbox24, 'Value');
check_val(25) = get(handles.checkbox25, 'Value');
check_val(26) = get(handles.checkbox26, 'Value');
check_val(27) = get(handles.checkbox27, 'Value');
check_val(28) = get(handles.checkbox28, 'Value');
check_val(29) = get(handles.checkbox29, 'Value');
check_val(30) = get(handles.checkbox30, 'Value');

get_index=find(check_val ~= 0 );
get_index=[get_index get_index(1)];

%--------------------------------------------------------------------------------------
load ('dist_mat.mat');

len_index=length(get_index);

num_iteration=15*len_index;

iterator=30*len_index;
num_child=0.8*iterator;

path=get_index;
num_path=length(path);

perm_path=path(2:num_path-1);
init_val=path(1);
num_perm_path=length(perm_path);

permuted_path=zeros(iterator,num_path);
for i =1:iterator
    permuted_path(i,:)=[init_val perm_path(randperm(num_perm_path)) init_val];
end

for j=1:iterator
    path_extract=permuted_path(j,:);
    sumval=0;
    for k=1:num_path-1
        sumval=sumval+m(path_extract(k),path_extract(k+1));
    permuted_path(j,num_path+1)=sumval;
    end
end

permuted_path=sortrows(permuted_path,num_path+1);

for iter=1:num_iteration
    index=randperm(num_child);
    for child_div=1:(num_child/2)
        parent1=permuted_path(index(2*child_div-1),2:num_path-1);
        parent2=permuted_path(index(2*child_div),2:num_path-1);
        cross_pos=ceil(rand*num_perm_path);
        first_item=permuted_path(1);
        
        child1=[parent1(1:cross_pos) parent2(cross_pos+1:num_perm_path)];
        unq_child1=unique(child1,'stable');
        rem_child1=setdiff(parent1,unq_child1,'stable');
        child1=[first_item unq_child1 rem_child1 first_item];
        
        child2=[parent2(1:cross_pos) parent1(cross_pos+1:num_perm_path)];
        unq_child2=unique(child2,'stable');
        rem_child2=setdiff(parent2,unq_child2,'stable');
        child2=[first_item unq_child2 rem_child2 first_item];
        
        permuted_path(iterator+2*child_div-1,1:num_path)=child1;
        permuted_path(iterator+2*child_div,1:num_path)=child2;
    
    end
    
    for fin_j=1:length(permuted_path)
        fin_path_extract=permuted_path(fin_j,:);
        fin_sumval=0;
        for fin_k=1:num_path-1
            fin_sumval=fin_sumval+m(fin_path_extract(fin_k),fin_path_extract(fin_k+1));
        permuted_path(fin_j,num_path+1)=fin_sumval;
        end
    end
    permuted_path=sortrows(permuted_path,num_path+1);
    permuted_path=permuted_path(1:iterator,:);
    final_path=permuted_path(1,1:num_path);
    
    scatter(a(:,1), a(:,2), 'filled');
    axis([0 100 0 100]);
    labels = num2str((1:size(a,1))','%d');
    text(a(:,1), a(:,2), labels, 'horizontal','left', 'vertical','bottom');
    hold on;
    for draw_line = 1:num_path-1
        axes(handles.TSP);
        drawLine([a(final_path(draw_line),1) a(final_path(draw_line),2)], [a(final_path(draw_line+1),1) a(final_path(draw_line+1),2)]);
        hold on;
    end
    hold off;
    set(handles.text1, 'String',['Distance = ' num2str(permuted_path(1,num_path+1))]);
end
%-------------------------------------------------------------------------------------------------------