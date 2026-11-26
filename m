Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701454;
	b=suywmCaXH9dQh3TU51amomRK88SIv9Qv1Z3Ae33Z6kR5ExANgaQuU777hQBsokPZhWKd
	 TvJE+UK1VjTKchC0iZSVS8Ul9UJcc7hfi8LfVG8igTK6leIrwL1cTce4T0LHQQi/xn1Xi
	 gfjyJcGzfeLrfwQZ19N8QeFeR4trfeN9L5Sv1Fu1/u3UtXeNVSGd8LhiavNnmE7BjZBIy
	 OR1ogrr86mVlZjEdiwwr4XJlAw5aSn0oYZzE/1ezqgWWbM28q7By/oN81Dw3bzoOxUX5o
	 SI8JT8oMMK8QXlztpxjebmS7lLhHXelv1o7oN0Mnf0kyO6cHm1vAardQYad137suT8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701454;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=QTEx19xF4fyqiz2y5UcBux96ZvXXWNuoLsIHYsaMNPA=;
	b=CYuRyLNH8PSWXXqzgQiii+rDZhmtp22L67fy4Yq4gn17kPGCwsJEhqryc+8ZR9mMHdyL
	 U3Is5kX30UiWw1fwXA70scC5zy4OiAcb2oFuwTCPFd5roP/k0lOS9MAauNLGIoeafY4+H
	 M89vQD5oY2QjYwbeJHi9tTVIt20TaEmWlzVk7G0Y5qG5LtjuLM0ZVhCXXBKqXRcoYHN8n
	 Qr4xDOFxmQe3d5J7hbZBsa3UDIdnmP52BWUzNWF7v8CvAnFhzhS8VFxokAyI6R6kCZbmM
	 ko6elZxj/6mjv3skIfMqjpTfzjXDBdOItexrWv23wmUYZ8AB93HnGUKKw/eJQdKolnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="PA8iGU/R";
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D41606A327
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=PA8iGU/R
DKIM2-Signature:  i=1; m=1; t=1795701451;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:hBw4SvEdXcf29jGoCv3staqDJrN4
   ++Bsp2b0bJhP2Z8JAPkqIYKWSMivubmv9VyOGMPwT3E2/efJkpUOe0v4W4P9Xli7ZD24d2G9XRZ
   Z0y5CuESJ8f/fs+EGIGClhUQFfNEpqDQKPivQP5ltX+MI83vYV6qhvYOdxHyiElHZBBOaIkob6G
   fTbNfYcK7YADtbTaA0+2JoleBfMnPv9jwjdQ+emU4sN2rNGtlU3xq2CsNogVbVH/AnLEbsBWzrR
   lNEylFeWG99AxcyDsmnu4jAkS+qEQhngRzQozFLmJHhGswv1OWp7W+ZzsRLPMiW4XsbcCstkrOO
   h/e4DTUeH7xYrA==;
Message-Instance:  m=1;
 h=sha256:
   4Bw6/Jn4FgK/zGmEZLFD89iOyh9k1J4NPqhWybWLhSM=:
   uoB5S9VuYOu+ML+icKBXWXwGiEgyglEXuTglChXFR08=,
  sha512:
   S45vZZQJ5sOFe3ZnaTSDHSfnNjt9OyTSSSzgDJvOUwZVQI3e/OE3GuDtTPuDvvOqS7+mG0b/0wwWoWJr/EytIg==:
   n1nuHtPywYW814ouCTGxyW5eUjKQtmfn1LMBoWxdqx/rHPv3/y60YUS7pKyJLsh2TAmfvnyvAk5Fk6UVB0ztRw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795701447; x=1796306247; i=markus.elfring@web.de;
	bh=QTEx19xF4fyqiz2y5UcBux96ZvXXWNuoLsIHYsaMNPA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PA8iGU/RCgyb1f0xe2VcQTsUtFFzK7Yk3S8vcJ3MhpTIxE6hzQu9ESPwUJvDeMCI
	 abTVtdpdPl3427hYymRRzIf/5cY7IIzbPfFYx2SMMfYwjW7vG2hup3XiXK/XMz53M
	 TfHjcE+SmZYu/4gUAMJ25zV5JoQnj09FxEUn+m4k4wIw3tOWHPFdpBeoUf4CBev/k
	 ZN5BclyO3tqV81TgOugCMZEJp68uSYO0upSiIxPTRwBIVwKhRwZtM97A69xKUsrQJ
	 3K2nKDqEOAmq7gC5heStk3rVZKiaKV7oATUtInmygm05IK3LbH2orLPRZlji14/b+
	 15+EZC+i6gcWYxHNpg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1xrWbz0OKa-00L6gr; Thu, 26
 Nov 2026 14:57:27 +0100
Message-ID: <50fd2d21-dfce-4bad-ba75-369806db021c@web.de>
Date: Thu, 26 Nov 2026 14:57:25 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: leds: rt4505: Put the child node reference
To: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>,
 linux-leds@vger.kernel.org
Cc: ChiYuan Huang <cy_huang@richtek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20261125130318.2590336-1-congnt264@gmail.com>
 <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
 <CAJpJ=GsvQVBONdbKCyTuBjBuCDSXG9gRoVxg3j+XPq4+HYr-MA@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAJpJ=GsvQVBONdbKCyTuBjBuCDSXG9gRoVxg3j+XPq4+HYr-MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j54Hl/JKNFRSP6Bc5E7fAo1LHyE8Y6+egXtz90txS+6Weicy+L9
 RWulskdsd5F3/8jmlAAV/n9H2yQDbAh9lNVnfOdebzsO48c3my6OdS/mBZMwTOyedlJsPw2
 WdR/Ig37hwgV29kkAav1om0y3fptKm58UvuU9y+jWxaDchd9zSDpRSer99IoWo217V9BAAg
 vMt7KK6xOqHc6f1eOMiBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UioDtJlw7+k=;jcbuPgQYDX+BL8bfFOzyxJX4O5X
 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

>> =E2=80=A6
>>> Drop the reference with a device managed action registered right after=
 the
>>> node is taken, so it is released after the LED class device that was
>>> registered later has been unregistered. leds-rt8515 puts the node of t=
he
>>
>> Would the identifier =E2=80=9Crt4505=E2=80=9D matter more here?
> Hi Markus,
>=20
> Do you mean that sentence should name rt4505?

It depends =E2=80=A6


>                                               It refers to leds-rt8515
> as a sibling driver that already puts the node. =E2=80=A6

I would prefer a clearer wording for a link to a related source code examp=
le
like rt8515_probe().
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/leds/flash/leds-r=
t8515.c#L275-L367


>>> same kind after registering its LED and flash sub-device.

Regards,
Markus
