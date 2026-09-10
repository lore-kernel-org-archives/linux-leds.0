Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE3598C15
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068727; cv=none; b=Ki9+iyLztCPoxxEFEXCNq1+Tmtr9UYe3b1LqgbBAKW6PmwLMjK6O+pJ0wTJVYvF/HdduCLYLZ8JdgiLiyJ16eZoy0qx9/FbJ/ihMV2QBPkydsNzrJUF8MzMDppFe1vB49NDeVfOaHw+tHlVXjCUakXoPzwisT4Y8cry8INKa6fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068727; c=relaxed/simple;
	bh=RVscuzOwWBLYOqPI0VAq65UPbl5BzTBhY3MPWSu7TYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPzA0u2/33gXCCNkHQfNrBuERK0GATnT3KFRiFAdBbOVTB5acy6hM0k3RVa4TLAU+VcGo9bNYNX+IMQgqB8rj7VdqW3ew+gb9UaUIWUslQSGxKtZ81j+8Y7Lx5bNl2BRNfniF61XLLI+iHXrcgWiHC2DbLW0o78lYtAAkB/urts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RosHvJK9; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RosHvJK9"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so63585b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 12:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068712; x=1789673512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEdV5Xs8ER2iH6ECRgXfLV1Fk4a++1FtqWHfmbg9CiM=;
        b=RosHvJK9DLK0FlPnzknkm7VlHCbjT6fsYBPIZKcvabHTFuvKkmzNvbSYKIfikaqHtc
         7fab1b9E0d3x7/+7bqzQqEkKybK8tvuS1RJM5+ez9HQ3ByWOxS1UTWx4CGZ428GgZPWL
         mPBxWuS5QN4kF+LEajLA2p6ch7yrI86NwVxJoWW+3acLARqivoKzVNc8A3cPUa67JG8W
         y+Y81VXs5tzI1Kr5aXGO2kiOfkfJe0LFJB/lG0LnzmLD0ihHV/iUTViFOXYhY1IO0KEJ
         VwNx2nrsNwn+8yTFMvNE3/ZtaHG/9WrfezbUsXaTPuMioWUfYeRrrG9aOn/IRs0A2SMA
         ppGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068712; x=1789673512;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gEdV5Xs8ER2iH6ECRgXfLV1Fk4a++1FtqWHfmbg9CiM=;
        b=m7vWR19zDjwWQwj2i5oGHnehmU9yixq+U6BoDeaGKJqzC7kSBwrpuLlm6q+0LZvWeP
         Uen7wH7hkJdaXwpd9OIA+cqYKyi0kS6QzxSSN+9jOmYC9ogocZ3gnFXvHiupqw0YF3x5
         vLqKGVQp25Hi7lmQJuHL2zaA6J+YUjISqGOvTs8KNifFM65i9zjqoGbciRcLTjPM7J5B
         q2C0AjienxN0BsdWBEBu84OaRZKueVI2G4M+FQXZZHy77UKTNZtek67/rkK0Ebe1fKbc
         R1Mp8iPohvaReOBPTT8ET06Y2EJkj2LkgkQVDbMAENTI+LQPJJnX5zdD9IPZyLlWl8Ap
         2oCA==
X-Forwarded-Encrypted: i=1; AKwUvBzyNrp5JXkr78mR+50oIeSxGZoqevV1G3p/rU/JbUcoN6fpkmqAmXugVwy3d+2eianK0vnBBk2LJe7r@vger.kernel.org
X-Gm-Message-State: AFuF++nyj2EiG/gdtJfGcB7SnJBUc74+SLb9yyaJb/cPP4C78siPtCuR
	6F4it1jVzS+DL/ffpomFUExqgjratp33RTk6ZjfbePq4Pv1rdJUdgLXE
X-Gm-Gg: AYBFou1MU502iPPLp6GmKfKDbD+cqwajGEDmFwF/7ohqymHMK+7uAdY2mXoC7dENJS6
	038KGRu57f75AC8kBH1KpeulIjv9W+aD0AFXyNIHYlQwFod+KJ4l/rdaNgyjPI4j9ykgfIIncEt
	CCRf4dsKOoa1Ds/EJkeeGJoLXpRJtX9UpGjTMMj08QhY9RwOls5vrWFJI56rHa929/YGDycIeVP
	wy8yVimoVtoVb75GpL5FGEcjZWtwnWZ36DomubG230gm/+/362LD5A4wr5hWXF41WlTS9EOWpHX
	SAkoghbRjcAAqd8Dt00d/ysm7Ar2dxIskE18qwrkr8t/U2gajGGLprDuKPUcOBlQo9k/e70p9D4
	k6NChgcc9CQxmdqgGRgeOIwclC0llCZg99kNVCLXecQMB5Kb4/fZ+PuNkDCTfmSzp8nl3wNxDkN
	/CEmgMZfxDenxiykaT+bcBBHevDZXkENYtNQPA8bK5NV0oozW+FRLUXV18aRZN80PS8i2xMU+am
	61yVIlciOFW070ax0hgq/70xRyf7MyNm0hO13k9rDcOI/oU
X-Received: by 2002:a05:6a00:ba8d:b0:857:72ba:ff0f with SMTP id d2e1a72fcca58-86b34efaaebmr529838b3a.23.1789068712105;
        Thu, 10 Sep 2026 12:31:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm79353b3a.58.2026.09.10.12.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 12:31:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c5fd98fc-2cfb-434a-8a81-3bf589049670@roeck-us.net>
Date: Thu, 10 Sep 2026 12:31:49 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
To: Arnd Bergmann <arnd@arndb.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Helge Deller <deller@gmx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, mfd@lists.linux.dev,
 Michael Hennerich <michael.hennerich@analog.com>,
 patches@opensource.cirrus.com, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
References: <CAPVz0n0ryOns2sCJE_jFana9MVzwEj1QZuPEa8FNhGbHXnMB+A@mail.gmail.com>
 <11652e5e-053e-45b0-98a0-0c1cb2aeedc4@app.fastmail.com>
 <7a92a79e-e22a-4e34-9f11-4086b88f62cc@roeck-us.net>
 <e33b42dc-1561-4819-b028-b13af9e7115b@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <e33b42dc-1561-4819-b028-b13af9e7115b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 12:15, Arnd Bergmann wrote:
> On Thu, Sep 10, 2026, at 20:38, Guenter Roeck wrote:
>>>
>> ...
>>> drivers/hwmon/ds620.c
>>> drivers/hwmon/f75375s.c
>>> drivers/hwmon/max1111.c
>>> drivers/hwmon/max197.c
>>
>> I missed the rationale for removing those, but then I don't really
>> mind either. I guess we'll hear if someone still uses any of those
>> drivers/chips.
> 
> None of these have devicetree support, and they are not usable
> with any of the remaining board files.
> 
>  From what I found:
> 
> - da620 apparently never had any users upstream, though it does
>    not require platform data and is theoretically usable with
>    an external dtb
> - f75375s was only used on iop32x (long gone)
> - max197 was used on x86/elan/ts5500, which is still in the
>    tree but cannot be enabled anymore because it is a 486 class SoC.
>    I have sent a separate patch to remove that platform
> - max1111 was used on spitz, which is on its way out for 7.4.
> 

As I said, I don't have any issues with removing them. Note though
that the ds620 driver (like many other hwmon drivers) does not require
devicetree or platform data to work just fine.

Thanks,
Guenter

