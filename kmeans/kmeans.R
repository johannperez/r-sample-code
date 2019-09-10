k_means <- function(data, k, iterations) {
 
  # verify data dimension
  if (length(dim(data)) != 2 || dim(data)[2] !=2)
    stop("Invalid data dimension. Valid dimensions are of the form (n,2) with n >= 0");
  
  # verify k is a number
  if (!is.numeric(k))
    stop("Invalid value for k");
  
  data_count <- dim(data)[1];
  
  # randomly take k numbers from 1 to data_count 
  c_indexes <- sample(1:data_count, size = k);
  
  # use c_indexes to select k points from data as the initial centers
  centers <- data[c_indexes, 1:2];
  
  # init all tags in the cluseter #1
  d_center_tag <- rep(1,dim(data)[1]);
  d_center_tag <- cbind(d_center_tag, data);
  
  
  for(it in 1:iterations)
  {
    #iterate over each point in data
    for(i in 1:data_count)
    {
      # take the distance to the first center
      min_d <- dist(rbind(data[i, 1:2], centers[1,1:2]));
      current_c <- 1;
      
      # iterate over each center
      for(j in 2:k)
      {
        # measure distance to the j-th center
        temp_d <- dist(rbind(data[i, 1:2], centers[j,1:2]));
        
        # if this distance is smaller than the smallest one so far, then change center
        if (temp_d < min_d)
        {
          min_d <- temp_d;
          current_c <- j;
        }
      }
      
      # once I iterated over every center, tag current point with the closest center
      d_center_tag[i,1] <- current_c;
    }
    
    df <- as.data.frame(d_center_tag);
    
    # update centers
    for (i in 1:k)
    {
      centers[i,1] = mean(filter(df, d_center_tag == i)[,2]);
      centers[i,2] = mean(filter(df, d_center_tag == i)[,3]);
    }
    
  }
  
  print(d_center_tag);

  return(centers)
}
