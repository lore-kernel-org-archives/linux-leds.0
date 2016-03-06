From: Karl Palsson <karlp@tweak.net.au>
Subject: Re: [PATCH v7 1/5] leds: core: add generic support for RGB LED's
Date: Sun, 06 Mar 2016 22:57:30 -0000
Message-ID: <20160306225612-549-34925-mailpile@palmtree-beeroclock-net>
References: <56DCAE2A.1070703@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454498334=="
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from palmtree.beeroclock.net ([178.79.160.154]:41089 "EHLO
	palmtree.beeroclock.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751510AbcCFXAS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Mar 2016 18:00:18 -0500
In-Reply-To: <56DCAE2A.1070703@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-leds@vger.kernel.org

--===============0454498334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> > I admit I hadn't seen this earlier, and I didn't spend all day
> > looking at previous attempts, but what's the motivation for
> > putting all this overloaded syntax into the "brightness" file? I
> > thought the point was to have a single value in each file, one of
> > the references I did find was
> > http://www.spinics.net/lists/linux-leds/msg02995.html Is there
> > some thread where this was decided as advantageous? Surely 0-255
> > for _brightness_ is what the brightness entry should do?
> > 
> The referenced mail thread refers to a proposed sysfs attribute
> holding a list of space-separated entries. Here it's still
> about one numeric value. Advantage of the approach used now is
> the full backwards compatibilty. You can still set brightness
> to 0..255 and only the brightness will change (as expected). Or
> in other words: So far only V was supported, now we support HSV
> as a superset.
> 
> > I'd like to set the rgb colour of a led (or hsv, that can be it's
> > own file too) and separately ramp the brightness up and down. I
> > also think it's substantially simpler and easier to use from the
> > user's point of view, which is surely the place you want easy
> > right?
> > 
> What you describe is perfectly possible with the new approach.
> 

Only by using magically different formats for what I write to the
file labelled "brightness" I'm really not a fan of a knob called
"brightness" that does _other things_ if you write something
different to it.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJW3LXbAAoJEBmotQ/U1cr2fdUQAKONfj98SS2b4zcHheXG4+ts
PfiyS3nhh3VxlNykJSF13ou6ZBgYs4vuTVFuXO2Vya07TFWGrRM4ZNM0d+3JU7BY
QkDq8nhqYkxBmIvuz3dgmr+HrMShT/ECQoOYSoIq9bAHpXj0v+eCvYnlLseVLBGx
inwgyBme0jSiXvITRDBc0YM0wvpnh492UlruOHGsGkoTSaPaBXU8E+Uv4sv+y448
muYI9M3l+4Lg+B5k9UyXEvwCi2pyLJ2pSGbXyk6flSWYxI92Mny0decOQ+myJqEr
sfIqOczGbXFXiWXo8oX2i/Dm9+b+ChrMEXAtcfMcuB+9+469p/2eoqcCCtMWnAUJ
qmM8h37mNoohwDIv9c4blG2Y2854n6L2R7ZCXGMZj1Thidmn7ANNhnIFp+ojyXsz
O/JSongYWxX4b9pMQ8QhZFRCXfi/V7c/0RDREN5IcjB5nm+1W4Wr/u0jqDGsD7hW
kYgWHLbRzBtjOk7ruyDRBNlUyV+xCwxmYgmHAo3Ko3ZPs0MAPQoD+u6mtG5BPDkY
ek8ek7+Zw1V8MQSKp1LEfVr6GX5rTkaTD13odbC8PcMYACAC6NKFDqS1NNvSclKv
nUyccdaxw0NU4WZtG1dalvJGMwMj6z5MT9BjlE9JvSs4vROYx7RGOQvGvxw9syJT
j5AL5VA86J8n30tDXFuy
=hUju
-----END PGP SIGNATURE-----

--===============0454498334==--
