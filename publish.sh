#!/bin/bash
# publish.sh
# Automates publishing tasks

npm run build

sed -i '' \
  -e 's|assets/fonts/dtl-prokyon.woff2|https://media.djangoproject.com/blog/images/2025/06/dtl-prokyon.woff2|g' \
  -e 's|assets/bg/Django_Day_CPH_2024_stickers.jpg|https://media.djangoproject.com/blog/images/2025/06/Django_Day_CPH_2024_stickers.jpg|g' \
  -e 's|assets/bg/left-cloud.svg|https://media.djangoproject.com/blog/images/2025/06/left-cloud.svg|g' \
  -e 's|assets/bg/right-cloud.svg|https://media.djangoproject.com/blog/images/2025/06/right-cloud.svg|g' \
  -e 's|assets/pony-flying.svg|https://media.djangoproject.com/blog/images/2025/06/pony-flying.svg|g' \
  output.css

font=$(cat assets/fonts/dtl-prokyon.woff2 | base64)
sed -i '' -e "s|assets/fonts/dtl-prokyon.woff2|$font|g" output.css

awk '
/<link[^>]*rel=["'\'']stylesheet["'\''][^>]*>/ {
  while ((getline line < "output.css") > 0) print "<style>" line "</style>";
  next
}
{ print }
' index.html > production.html

sed -i '' -e 's|<meta name="robots" content="noindex">||g' production.html

sed -i '' \
  -e 's|assets/photos/events/djangocon_europe_2022_chaim_kirby_dsf_why_and_how.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2022_chaim_kirby_dsf_why_and_how.webp|g' \
  -e 's|assets/photos/djangonaut_space/djangonaut_space_session_1_debrief_team_venus.jpg|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_session_1_debrief_team_venus.jpg|g' \
  -e 's|assets/photos/djangonaut_space/djangonaut_space_session_2_onboarding.jpg|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_session_2_onboarding.jpg|g' \
  -e 's|assets/photos/djangonaut_space/djangonaut_space_session_3_celebrations.jpg|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_session_3_celebrations.jpg|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_mariusz_on_stage.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_mariusz_on_stage.webp|g' \
  -e 's|assets/graphs/what_aspects_of_the_website_would_you_like_to_see_improved.webp|https://media.djangoproject.com/blog/images/2025/06/what_aspects_of_the_website_would_you_like_to_see_improved.webp|g' \
  -e 's|assets/graphs/grants_by_region_in_2024-2023.webp|https://media.djangoproject.com/blog/images/2025/06/grants_by_region_in_2024-2023.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_mariusz_and_cagil.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_mariusz_and_cagil.webp|g' \
  -e 's|assets/videos/djangocon_europe_2024_jake_howard_RxcRBNqxjeY.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_jake_howard_RxcRBNqxjeY.webp|g' \
  -e 's|assets/videos/djangocon_europe_2024_meritxell_sarda_ventosa_1NkZEQ8g6OU.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_meritxell_sarda_ventosa_1NkZEQ8g6OU.webp|g' \
  -e 's|assets/videos/djangocon_europe_2024_mia_bajic_AERuDe9YxWE.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_mia_bajic_AERuDe9YxWE.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_group_photo.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_group_photo.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_beach.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_beach.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_htmx-talk.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_htmx-talk.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_sprints.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_sprints.webp|g' \
  -e 's|assets/photos/djangocon_europe_2024/djangocon_europe_2024_anna_and_rachell.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_anna_and_rachell.webp|g' \
  -e 's|assets/photos/europython/europython_2024_david_katia_paolo.webp|https://media.djangoproject.com/blog/images/2025/06/europython_2024_david_katia_paolo.webp|g' \
  -e 's|assets/photos/europython/europython_2024_dsf_badge.webp|https://media.djangoproject.com/blog/images/2025/06/europython_2024_dsf_badge.webp|g' \
  -e 's|assets/photos/europython/europython_2024_paolo_sarah_cagil.webp|https://media.djangoproject.com/blog/images/2025/06/europython_2024_paolo_sarah_cagil.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_lacey_henschel_ctkC-_Y1EaM.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_lacey_henschel_ctkC-_Y1EaM.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_kudzayi_bamhare_FcDVSUh-Njk.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_kudzayi_bamhare_FcDVSUh-Njk.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_sarah_boyce_SmwL00tSzhE.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_sarah_boyce_SmwL00tSzhE.webp|g' \
  -e 's|assets/photos/djangocon_us_2024/djangocon_us_kojo_idrissa_orientation.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_kojo_idrissa_orientation.webp|g' \
  -e 's|assets/photos/djangocon_us_2024/djangocon_us_hallway_track.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_hallway_track.webp|g' \
  -e 's|assets/photos/djangocon_us_2024/djangocon_us_django_girls_shirts_crew.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_django_girls_shirts_crew.webp|g' \
  -e 's|assets/photos/djangocon_us_2024/djangocon_us_signed_tote_bag.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_signed_tote_bag.webp|g' \
  -e 's|assets/videos/djangocon_us_2023_abigail_afi_gbadago_YrlSlOZOkNQ.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2023_abigail_afi_gbadago_YrlSlOZOkNQ.webp|g' \
  -e 's|assets/videos/djangochat_jeff_triplett.webp|https://media.djangoproject.com/blog/images/2025/06/djangochat_jeff_triplett.webp|g' \
  -e 's|assets/videos/djangoday_cph_2022_paolo_QE9XgoSMCJI.webp|https://media.djangoproject.com/blog/images/2025/06/djangoday_cph_2022_paolo_QE9XgoSMCJI.webp|g' \
  -e 's|assets/videos/djangocon_europe_2024_tom_carrick_JUCo9I08tgc.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_tom_carrick_JUCo9I08tgc.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_frank_wiles_YE_SXB7xkSw.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_frank_wiles_YE_SXB7xkSw.webp|g' \
  -e 's|assets/videos/djangonaut_space_carlton_gibson_YOZWF86TGmo.webp|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_carlton_gibson_YOZWF86TGmo.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_tim_schilling_J0OrbAPKdHc.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_tim_schilling_J0OrbAPKdHc.webp|g' \
  -e 's|assets/videos/djangonaut_space_emma_delescolle_Urab3PVYXio.webp|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_emma_delescolle_Urab3PVYXio.webp|g' \
  -e 's|assets/videos/djangochat_lily_foote.webp|https://media.djangoproject.com/blog/images/2025/06/djangochat_lily_foote.webp|g' \
  -e 's|assets/photos/events/Django-Day-CPH-2024-group-photo.jpg|https://media.djangoproject.com/blog/images/2025/06/Django-Day-CPH-2024-group-photo.jpg|g' \
  -e 's|assets/photos/events/django_day_cph_2024_badges.jpg|https://media.djangoproject.com/blog/images/2025/06/django_day_cph_2024_badges.jpg|g' \
  -e 's|assets/photos/events/django-london-2024-quizz.jpg|https://media.djangoproject.com/blog/images/2025/06/django-london-2024-quizz.jpg|g' \
  -e 's|assets/videos/djangonaut_space_simon_charette_IakfTkQIuFw.webp|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_simon_charette_IakfTkQIuFw.webp|g' \
  -e 's|assets/videos/pycharm_django_development_trends_2at9FtNncbc.webp|https://media.djangoproject.com/blog/images/2025/06/pycharm_django_development_trends_2at9FtNncbc.webp|g' \
  -e 's|assets/videos/djangonaut_space_abigail_mesrenyame_dogbe_GvZDTdQkedg.webp|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_abigail_mesrenyame_dogbe_GvZDTdQkedg.webp|g' \
  -e 's|assets/photos/events/django_india_meetup_1.jpg|https://media.djangoproject.com/blog/images/2025/06/django_india_meetup_1.jpg|g' \
  -e 's|assets/photos/events/django_india_x_pydelhi_meetup.jpg|https://media.djangoproject.com/blog/images/2025/06/django_india_x_pydelhi_meetup.jpg|g' \
  -e 's|assets/videos/djangonaut_space_daniele_procida_wcNx1BPc_M8.webp|https://media.djangoproject.com/blog/images/2025/06/djangonaut_space_daniele_procida_wcNx1BPc_M8.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_sage_abdullah_qFUQO8HUdIQ.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_sage_abdullah_qFUQO8HUdIQ.webp|g' \
  -e 's|assets/videos/djangocon_europe_2024_eli_rosselli_VyVfgrl3B7Y.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_europe_2024_eli_rosselli_VyVfgrl3B7Y.webp|g' \
  -e 's|assets/videos/djangogirls_your_django_story_meet_emmanuelle_delescolle.webp|https://media.djangoproject.com/blog/images/2025/06/djangogirls_your_django_story_meet_emmanuelle_delescolle.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_natalia_reYtEsqwIOU.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_natalia_reYtEsqwIOU.webp|g' \
  -e 's|assets/videos/djangochat_natalia_and_sarah.webp|https://media.djangoproject.com/blog/images/2025/06/djangochat_natalia_and_sarah.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_sarah_OEskMO_cvpw.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_sarah_OEskMO_cvpw.webp|g' \
  -e 's|assets/videos/djangocon_us_2024_jacob_lsJKBbjppVg.webp|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_jacob_lsJKBbjppVg.webp|g' \
  -e 's|assets/photos/people/chaim_kirby_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/chaim_kirby_linkedin.jpg|g' \
  -e 's|assets/photos/people/cagil_ulusahin_sonmez_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/cagil_ulusahin_sonmez_linkedin.jpg|g' \
  -e 's|assets/photos/people/thibaud-heart-web.jpg|https://media.djangoproject.com/blog/images/2025/06/thibaud-heart-web.jpg|g' \
  -e 's|assets/photos/people/jacob_kaplan-moss_github.jpg|https://media.djangoproject.com/blog/images/2025/06/jacob_kaplan-moss_github.jpg|g' \
  -e 's|assets/photos/people/sarah_abderemane_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/sarah_abderemane_linkedin.jpg|g' \
  -e 's|assets/photos/people/katie_mclaughlin_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/katie_mclaughlin_linkedin.jpg|g' \
  -e 's|assets/photos/people/katia_nakamura_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/katia_nakamura_linkedin.jpg|g' \
  -e 's|assets/photos/people/catherine_holmes_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/catherine_holmes_linkedin.jpg|g' \
  -e 's|assets/photos/people/sarah-boyce-django-core-demystified.jpg|https://media.djangoproject.com/blog/images/2025/06/sarah-boyce-django-core-demystified.jpg|g' \
  -e 's|assets/django-heart.svg|https://media.djangoproject.com/blog/images/2025/06/django-heart.svg|g' \
  -e 's|assets/photos/djangocon_us_2024/djangocon_us_2024_group_photo.jpg|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2024_group_photo.jpg|g' \
  -e 's|assets/photos/people/aman_pandey_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/aman_pandey_linkedin.jpg|g' \
  -e 's|assets/photos/people/salvo_polizzi_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/salvo_polizzi_linkedin.jpg|g' \
  -e 's|assets/photos/people/bendeguz_csirmaz_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/bendeguz_csirmaz_linkedin.jpg|g' \
  -e 's|assets/photos/people/shafiya_adzhani_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/shafiya_adzhani_linkedin.jpg|g' \
  -e 's|assets/photos/people/djangocon_us_2023_rachell_portrait.jpg|https://media.djangoproject.com/blog/images/2025/06/djangocon_us_2023_rachell_portrait.jpg|g' \
  -e 's|assets/CHAOSS-DEI-Bronze-Badge.svg|https://media.djangoproject.com/blog/images/2025/06/CHAOSS-DEI-Bronze-Badge.svg|g' \
  -e 's|assets/photos/people/afi_sarah_natalia_velda.jpg|https://media.djangoproject.com/blog/images/2025/06/afi_sarah_natalia_velda.jpg|g' \
  -e 's|assets/graphs/dsf-2024-income-expenses-sankey.svg|https://media.djangoproject.com/blog/images/2025/06/dsf-2024-income-expenses-sankey.svg|g' \
  -e 's|assets/photos/people/frank_wiles_headshot-300.jpg|https://media.djangoproject.com/blog/images/2025/06/frank_wiles_headshot-300.jpg|g' \
  -e 's|assets/photos/people/carlton_gibson_github.jpg|https://media.djangoproject.com/blog/images/2025/06/carlton_gibson_github.jpg|g' \
  -e 's|assets/photos/people/tim_schilling_bluesky.jpg|https://media.djangoproject.com/blog/images/2025/06/tim_schilling_bluesky.jpg|g' \
  -e 's|assets/photos/people/emma_delescolle_mastodon.jpg|https://media.djangoproject.com/blog/images/2025/06/emma_delescolle_mastodon.jpg|g' \
  -e 's|assets/photos/people/lily-acorn-github.jpg|https://media.djangoproject.com/blog/images/2025/06/lily-acorn-github.jpg|g' \
  -e 's|assets/photos/people/tom_carrick_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/tom_carrick_linkedin.jpg|g' \
  -e 's|assets/photos/people/abigail_afi_gbadago_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/abigail_afi_gbadago_linkedin.jpg|g' \
  -e 's|assets/photos/people/jeff_triplett_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/jeff_triplett_linkedin.jpg|g' \
  -e 's|assets/photos/people/paolo_melchiorre_linkedin.jpg|https://media.djangoproject.com/blog/images/2025/06/paolo_melchiorre_linkedin.jpg|g' \
  -e 's|assets/bg/laptop-conference-stickers-vertical.webp|https://media.djangoproject.com/blog/images/2025/06/laptop-conference-stickers-vertical.webp|g' \
  -e 's|assets/django-logo-negative.svg|https://media.djangoproject.com/blog/images/2025/06/django-logo-negative.svg|g' \
  production.html

echo "Publish tasks complete. Edit this script to add more changes as needed."
