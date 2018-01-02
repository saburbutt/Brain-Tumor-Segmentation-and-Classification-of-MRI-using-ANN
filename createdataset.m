folder = 'D:\Semesters\Research leap\MRI\FYP GUI\Database\Tumor T2 Selected\HG\00FinalSelection';
ListOfImageNames = {};
ImageFiles = dir([folder '/*.*']);% Get all files.

parfor Index = 1:length(ImageFiles)
	baseFileName = ImageFiles(Index).name;
	[folder, name, extension] = fileparts(baseFileName);
	extension = upper(extension);
	% Let's save just those we are interested in:
	switch lower(extension)
	case {'.png', '.bmp', '.jpg', '.tif', '.avi'}
		% Allow only PNG, TIF, JPG, or BMP images
		ListOfImageNames = [ListOfImageNames baseFileName];
	otherwise
	end
end
% Now ListOfImageNames is a list of all image format files.
% Now do whatever you want with that list.