function array_push_unique(arr, element)
{
	if !array_contains(arr, element) { array_push(arr, element); }
}