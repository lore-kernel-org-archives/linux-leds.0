Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696493;
	b=SXmlmNr1hSKEhwgnlIg/1ULTpqDZyIFq6xlC8aN7zBRf0KdrXO/kM57NeExtQ8imb7wR
	 ClIPnAJfz9fRkDNWDUkbIX9DZyMCPm8/3SdT/C5A8f7b6mHAFS/6cfRNLj9f3i/7FpZ5F
	 F59JNRxq4q3rdjtzWQe99ytvVeEzpnizQ70PgySi3nQTzduA8uO+sE1+bEMzZ08uNXLRj
	 gUTOYggyCFizURYUGWUb4BCqiEwe+pqBmdq2HTbCQoH+gE08QRkrAKGeeBPYeCOIzyP2U
	 d9QZNNKamLa2m36xSpqtTlXaEG/Hp2Izg17Wv+Xs2gEvahRBDgeJ/+/DsybQJPE+h2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
	b=ArMqb+v4yLzVR8kjFkJ+Qoc+BOFwdZfsWH1v4D2cRatcBn5EkVYE4Zf9ALwz2LB2HBzV
	 MMnKAtaz2rUaHeV3glHytAGvE0wTt1D6NTIKxqsvHoWNkk4kdG7uLrAj8Ce52zcb6JOOy
	 aPujuzHlhlDM7qiTxxO0N84iKg5GDMqm4rob8zm9ZHuRXjcTfwgEs/KhWgN8D1yPwyJfC
	 vGNqlsHXfdYx9jueGQ3Elnx2O12DMXniQxpbzem212s/53Xjm4dt7+MouVy1XyN1kn967
	 OT/WlJ1gJFylZck8a0NUxZdmVlKs7yGH2uZDxNY2wxrqcbnwGsotLRuA7KOv9SG/Ysg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYB2dn7S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE50606A338
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE50606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYB2dn7S
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b531cd9bbaso59868527b3.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696491; cv=none;
        d=google.com; s=arc-20260327;
        b=rgzpuY765xCRukHsrSAm9fWIemEOppt3Ppvey8gAzX3+KhfOU4gPpNyhIk7h44sJFD
         wpXZ1k9m1F8FEmV66FcD9l3ra2dbFON2W1TrP0NUVUutWVLqnNmY4m4/KtiZQqjoGuT3
         tPw6yBYXDZKRqFLVHsyacOdniUL6lftbv3THhylyfofvJopucshPid2/f+rGs5McyyJY
         gWO3WS69dQt4WGljtF6sIo7rJaBFRmr1MCjWIj5IOav+K1xMEa06wzVeJwXfxNKc3ple
         vOTwSUbmxQRXPi9jRuAAitUbRKErvsMGdsNl7V1WG1S45VhhoWUeX5E8/RRGeBna9+8y
         y/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        fh=8yn3ohjPB3ad2gO1qP/oMJLY/0QwlG7I3JbHbyNzxmc=;
        b=YYRrKwC7VKHbjZBh2eoFTqTZ+EluWvp4qAOlTsdBbqadoJhMopdaYQ4dJICG8eVaIh
         CZu1LFaHXri2buONmxQbmtzRSb2kJO192f9dulZOuu5rxaCMP85LFampjg1DS/vzVy7n
         sQitll82j5wuaLlJfx/g4LWXmwUVQT+kLGNeLVDAz1QYxdiFbK6i6DHQMuzAz2cby/a1
         AL94pe134k7jJN6QuPH3eJjx8ApztIAnrWtd95OWjaaOrCho7l81wbFgmpovMBVnDBxl
         2yq2sufxkkuIHWVAyypER88FingBf17yLaHHRI6j/0gLooAmR7IovpGr9QUqsoE0mei5
         50oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696491; x=1796301291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        b=gYB2dn7S6lZJ5cNDrDXU2kUngQanm3LaWvesgltsgxLzldlXABGf96WZNq0+0V1ZKV
         JJyU/Y5eJ4dczDpbZ6f0OT4jc04IPvbm3miCxAc8cPu/rIAbN/JIir0zxJxK9ykpMjoJ
         OcfN9CCbrEJDzzbjpkBxPjYKl3pzXdkbbzEqE5WpRxNDRzUBvwS373UcOBAmE3YBqPkH
         ySjaHyladr0feRfzgs1r+XLyihZ7RrUMXMq4rOsAT/Yb6ZqfEwc9MrXtwYx6xzQHKRKo
         QrdV90oB3Z8o824wjOUz7d0PsxfhqQ8NIR+e0efbAp02kTFEBBEhB2sgw1Zox0wECCjr
         EaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696491; x=1796301291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        b=rDuA+yZyBbsQyl3F4GUCb+aErujnxzsa3RIuBMAxKDk1HPQjvbkdbu/gGFcDPStqUF
         Qt955RjkowoT/1ODWyBmaY1ss5Uw6Hm6b4q33pYTOE28X+7GFVkITyH67iOTv7iupu1H
         MJiHeec2BQ6Q7fOsDwmZDYFwNYK8Ci33GVkKb3IkNSshEuvTG25jdqETJ0aLHenTLvYm
         POPQvaNx6uBPjumW+sMtnAJENs33Cm9KLVzwtUIgmWQj36MVolo9uNN+o98Hy5NBivMw
         osK2alLpAmJmXBnRzRnEwLDHhoEB4k7ukXhbVyNdXqnDI2izywcCXCP6g5Baz0JMh9mz
         jAgg==
X-Gm-Message-State: APuU4Z+TDCMxf+hVJeyeRv+K8uT+nfftaXxPFlxupz2u82YqM1wLLAou
	3CLx8cPqh0UFUgGCcr8DeeykPYJo3XZdCfp1iZLBlekRE48RULRAro4SRB4DDXFzJi9d/h4uwiO
	pj8n9xCWwo1ae0FN3+Cr+KUEfAYYw2MME7kNj
X-Gm-Gg: AZFdTZdEbc/uLlHOJVEuax2SVHLKx7ZTW12UsoVsYKtXugVm1y+D4uEYDB4N35z025e
	RqWZvfvG6EFUxQ6LamcWHbunpjCtph3z6QTZzUSM2+H7nOZBBZnXf9cIFG1rzPVamtQv+dWuJkJ
	A1H92KyKl3306nzP6rP8R8kNPgU9KMC2BhJ4XYZWgpcfhmnjWZVE2QpG2FiO2z+ae7VkMQif9CM
	nNu7fSIY58h4FaHR6Vzfzf+PeCabYGh7rwpl/W7xy1lxUsOWi+nEsOIf8LosUQPnvSgm4Bsd7bA
	mKxzZEH+9bvSOZIHsJoIf2YzlWTBOmjUr8qwyE46pl7JBWJ/gs+9sgKJkAe0uoKVmQ6RsLLoZtj
	Ju8Yrv9BZUig8y5NtVLH8UDArXTiOcFxjtBfErfbmuEDaAP3YGcGT9O7sjkkkJZINIG17UQ==
X-Received: by 2002:a05:690c:886:b0:8b4:d1d3:36f7 with SMTP id
 00721157ae682-8b52054a9a1mr88892787b3.53.1795696491522; Thu, 26 Nov 2026
 04:34:51 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125130318.2590336-1-congnt264@gmail.com> <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
In-Reply-To: <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 19:34:39 +0700
X-Gm-Features: Aa3M54qLk9RSMM85pLCadOXRpeQlM3Wwp1UCxR9_4VUEKEkcdCZfev9BbSJuZow
Message-ID: <CAJpJ=GsvQVBONdbKCyTuBjBuCDSXG9gRoVxg3j+XPq4+HYr-MA@mail.gmail.com>
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:13=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Drop the reference with a device managed action registered right after =
the
> > node is taken, so it is released after the LED class device that was
> > registered later has been unregistered. leds-rt8515 puts the node of th=
e
>
> Would the identifier =E2=80=9Crt4505=E2=80=9D matter more here?
Hi Markus,

Do you mean that sentence should name rt4505? It refers to leds-rt8515
as a sibling driver that already puts the node. The driver being fixed
is rt4505, named in the subject.

Thanks,
Cong

>
>
> > same kind after registering its LED and flash sub-device.
>
>
> Regards,
> Markus
