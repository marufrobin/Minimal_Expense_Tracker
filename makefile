freeze:
	dart run build_runner build --delete-conflicting-outputs
# 	flutter pub run build_runner build

apk:
	flutter build apk

appBundle:
	flutter build appbundle