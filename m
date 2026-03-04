Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF53321B1;
	Wed,  4 Mar 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625491; cv=none; b=BTO+mLtoZmNmvkAnRp4p61cZQb+9ACvhDUxqbu/s2lXpDUUykVtq1guwZuece/7Zrn4XNd3xRa72Mz2JxBx3GYqe95D/m6r6MDnyJ7TXKkWf+FP1jdcKhb8x33vqlrmWluOScfRyIFZ2PiGabmDoem0UMVlLjG0xLhy1T5jgr48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625491; c=relaxed/simple;
	bh=WhnQCdpT0G1Q+piKtfwsb/JgyLuVh+QO/XgbkQocNtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWXZqwE3WJEm+YHKqUhWbgVP0mq2R8bAi039m4Ouqx6+ONZRQbHNC/RkCbscwutqTOoQQv7RmLlv6ARtoKylkjTv+pVM9E7h6BXvwvhAwUmKgyhdaJBWBiJA5qVkUPpgGBjZfHPUU8Wq8M9skxiyA63Q2k84UrHulanyDwu1WR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=AQOGbWSy; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="AQOGbWSy"
Received: from [192.168.178.24] (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7D2AA2FC0050;
	Wed,  4 Mar 2026 12:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772625486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKWrE4iCLrPsX2wLKeszJtkH3PK18TO8n3OTlh7u58s=;
	b=AQOGbWSyh/YMX1ZaB7TARUv0X/bsc5Pv47bxhM3sm9X5zS2gOViSf2r+iJTV856fnzyU/N
	BtfU/22Bb1LRxS4nHctN9c1Wjxa3SMI3sRlhI2JhH/s1XoFpkc4LvLvBGepVcxujfcSBsm
	+8EhGSbaSo8Av7QSHRGHrcXtl2m+76k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2f9918d2-b62b-41d7-9f80-8a3554764ade@tuxedocomputers.com>
Date: Wed, 4 Mar 2026 12:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maximum values for multi_intensity sysfs attribute
To: =?UTF-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>,
 Armin Wolf <W_Armin@gmx.de>, linux-leds@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
 <90a08353-429c-4603-bc6f-536a789fe5fa@protonmail.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <90a08353-429c-4603-bc6f-536a789fe5fa@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Barnabás,

Am 04.03.26 um 12:45 schrieb Pőcze Barnabás:
> Hi
>
> 2026. 02. 14. 20:15 keltezéssel, Armin Wolf írta:
>> Hello,
>>
>> i am currently adding support for RGB keyboard backlight control to the uniwill-laptop
>> driver, and want to use the multicolor LED class for that. However the hardware interface
>> is a bit exotic:
>>
>> - 5 global brightness levels
>> - 50 intensity levels for each R/G/B channel
>>
>> I am now asking myself how this should be mapped onto the multi_intensity sysfs attribute.
>> Should i set max_brightness to 5 and reject intensity values larger that 50? Or should
>> i set max_brightness to 50 and interpolate? What is the input range of intensity values?
> Is that the same interface implemented by https://github.com/pobrn/hid-ite8291r3
> (and https://github.com/pobrn/ite8291r3-ctl)?
>
> In any case it's probably not too different. Unfortunately I don't recall ever finding a
> satisfying way to integrate it with the multi-color led things. The best approach I could
> find: brightness as [0; 50], while multi_intesity is [0; 255], essentially specifying the
> color of each channel (simply clamping, without `led_mc_calc_color_components()`). Note that
> the above kernel driver does not implement per-key color setting, so this approach seemed
> most sensible.

Note that some devices control the brightness levels via EC directly when 
pressing a key combo with no way of disabling that. So the 5 brightness levels 
can't be easily abstracted away.

For best compatibility I would still suggest adapting the brightness levels of 
the firmware (5 levels), it will cause headaches down the road otherwise.

Best regards,

Werner

>
>
> Barnabás Pőcze
>
>> Thanks,
>> Armin Wolf
>>
>>
>
