import { createClient } from "@supabase/supabase-js";

//TODO enlever les varibles lol
const supabaseUrl = "https://ygppubsjtnaqqqewruqj.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlncHB1YnNqdG5hcXFxZXdydXFqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQzNjc0MDQsImV4cCI6MjA3OTk0MzQwNH0.doG6iBXTKcAomiZEL3iyuSjFC2faC6cyMv5FJVXrOJQ";

export const supabase = createClient(supabaseUrl, supabaseKey);
