# slideshow_app
## 目的
キーワード合致する SlideShare を検索します

## 使い方

```
% git clone https://github.com/maangie/slideshow_app.git
% cd slideshow_app
% bin/bundle
% mkdir tmp
% cp config/secrets.yml.dist config/secrets.yml
```

- `tmp` に ssl 証明書ファイル `cacert.pem` を置く
- config/secrets.yml に、[SlideShare » Apply For API Keys](http://www.slideshare.net/developers/applyforapi) から入手した API キーと秘密鍵を書く

```
% bin/rails server
```
