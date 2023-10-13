

drop table listing cascade;
drop table census_g01 cascade;
drop table census_g02 cascade; 




create table if not exists listing(
	listingid int not null primary key,
	scrape_id int null,
	scraped_date date null,
	host_id int null,
	host_name text null,
	host_since date null,
	host_is_superhost text null,
	host_neighbourhood text null,
	listing_neighbourhood text null,
	poperty_type text null,
	room_type text null,
	accommodates int null,
	price int null,
	has_availablity text null, 
	availablility_30 int null,
	number_of_reviews int null,
	review_scores_rating int null,
	review_scores_accuracy int null,
	review_scores_cleanliness int null,
	review_scoroes_checkin int null,
	review_scores_communication int null,
	review_scores_scores_value int null
	);
	
create table if not exists census_g01 (
	lga_code_2016 text not null primary key,
	tot_p_m int null,
	top_p_f int null,
	top_p_p int null,
	age_0_4_yr_m int null,
	age_0_4_yr_f int null,
	age_0_4_yr_p int null,
	age_5_14_yr_m int null,
	age_5_14_yr_f int null,
	age_5_14_yr_p int null,
	age_15_19_yr_m int null,
	age_15_19_yr_f int null,
	age_15_19_yr_p int null,
	age_20_24_yr_m int null,
	age_20_24_yr_f int null,
	age_20_24_yr_p int null,
	age_25_34_yr_m int null,
	age_25_34_yr_f int null,
	age_25_34_yr_p int null,
	age_35_44_yr_m int null,
	age_35_44_yr_f int null,
	age_35_44_yr_p int null,
	age_45_54_yr_m int null,
	age_45_54_yr_f int null,
	age_45_54_yr_p int null,
	age_55_64_yr_m int null,
	age_55_64_yr_f int null,
	age_55_64_yr_p int null,
	age_65_74_yr_m int null,
	age_65_74_yr_f int null,
	age_65_74_yr_p int null,
	age_75_84_yr_m int null,
	age_75_84_yr_f int null,
	age_75_84_yr_p int null,
	age_85ov_m int null,
	age_85ov_f int null,
	age_85ov_p int null,
	counted_census_night_home_m int null,
	counted_census_night_home_f int null,
	counted_census_night_home_p int null,
	count_census_nt_ewhere_aust_m int null,
	count_census_nt_ewhere_aust_f int null,
	count_census_nt_ewhere_aust_p int null,
	indigenous_psns_aboriginal_m int null,
	indigenous_psns_aboriginal_f int null,
	indigenous_psns_aboriginal_p int null,
	indig_psns_torres_strait_is_m int null,
	indig_psns_torres_strait_is_f int null,
	indig_psns_torres_strait_is_p int null,
	indig_bth_abor_torres_st_is_m int null,
	indig_bth_abor_torres_st_is_f int null,
	indig_bth_abor_torres_st_is_p int null,
	indigenous_p_tot_m int null,
	indigenous_p_tot_f int null,
	indigenous_p_tot_p int null,
	birthplace_australia_m int null,
	birthplace_australia_f int null,
	birthplace_australia_p int null,
	birthplace_elsewhere_m int null,
	birthplace_elsewhere_f int null,
	birthplace_elsewhere_p int null,
	lang_spoken_home_eng_only_m int null,
	lang_spoken_home_eng_only_f int null,
	lang_spoken_home_eng_only_p int null,
	lang_spoken_home_oth_lang_m int null,
	lang_spoken_home_oth_lang_f int null,
	lang_spoken_home_oth_lang_p int null,
	australian_citizen_m int null,
	australian_citizen_f int null,
	australian_citizen_p int null,
	age_psns_att_educ_inst_0_4_m int null,
	age_psns_att_educ_inst_0_4_f int null,
	age_psns_att_educ_inst_0_4_p int null,
	age_psns_att_educ_inst_5_14_m int null,
	age_psns_att_educ_inst_5_14_f int null,
	age_psns_att_educ_inst_5_14_p int null,
	age_psns_att_edu_inst_15_19_m int null,
	age_psns_att_edu_inst_15_19_f int null,
	age_psns_att_edu_inst_15_19_p int null,
	age_psns_att_edu_inst_20_24_m int null,
	age_psns_att_edu_inst_20_24_f int null,
	age_psns_att_edu_inst_20_24_p int null,
	age_psns_att_edu_inst_25_ov_m int null,
	age_psns_att_edu_inst_25_ov_f int null,
	age_psns_att_edu_inst_25_ov_p int null,
	high_yr_schl_comp_yr_12_eq_m int null,
	high_yr_schl_comp_yr_12_eq_f int null,
	high_yr_schl_comp_yr_12_eq_p int null,
	high_yr_schl_comp_yr_11_eq_m int null,
	high_yr_schl_comp_yr_11_eq_f int null,
	high_yr_schl_comp_yr_11_eq_p int null,
	high_yr_schl_comp_yr_10_eq_m int null,
	high_yr_schl_comp_yr_10_eq_f int null,
	high_yr_schl_comp_yr_10_eq_p int null,
	high_yr_schl_comp_yr_9_eq_m int null,
	high_yr_schl_comp_yr_9_eq_f int null,
	high_yr_schl_comp_yr_9_eq_p int null,
	high_yr_schl_comp_yr_8_belw_m int null,
	high_yr_schl_comp_yr_8_belw_f int null,
	high_yr_schl_comp_yr_8_belw_p int null,
	high_yr_schl_comp_d_n_g_sch_m int null,
	high_yr_schl_comp_d_n_g_sch_f int null,
	high_yr_schl_comp_d_n_g_sch_p int null,
	count_psns_occ_priv_dwgs_m int null,
	count_psns_occ_priv_dwgs_f int null,
	count_psns_occ_priv_dwgs_p int null,
	count_persons_other_dwgs_m int null,
	count_persons_other_dwgs_f int null,
	count_persons_other_dwgs_p int null
	);

create if not exists census_g02