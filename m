Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4549F12C
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050583; cv=pass; b=JzU+tY0xTpqINAwttvgWEOcKyCV4fFdC4aQZ6uyOLug6oCQwLg67eE8lu0dPAUOa1Uh7CwO0o3G8e2/Up1H2ZMOdfxRVZ9zjuxBOtl7fiB1S/nYppwns1awzRQCs/ERAMaeB7uNrZaCJsbjm+jUUbSoQLGxUOAMjTiKCWh7NnLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050583; c=relaxed/simple;
	bh=s0GzHLToX8l2pJV6FGUrdQW+qoZWtYzYSSm2Om3AhAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVyjEkOF5woc/vbQg9F82Dqj6hh0n8g6kgIjYrR2ZdHaic+JazghoXtzjG2LqdN7EW/SmFDabAiNs2jfvjszeYEzcg1vHjl/W9iTUwRrMmwVWkqMi+912PPN/0YhHeAgeD46bUrEvy0OiuZgPRyVD1jwMa7Na5M15kviSY9T+VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0cx1fJ/; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0cx1fJ/"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3337025eec.0
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 00:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050580; cv=none;
        d=google.com; s=arc-20260327;
        b=oKpOy8aTN5/6SVFBuB/dmZ1Z/O6ZxAfBoraRz2JaiJ0zNIf1T6MwunZZ3RLnN/ENqn
         IZAhKCgPy4Lygq6G6EQy2VVJ4ipJoLtJFaI8CTZuf874WQ5XzXfKr/biq9uT3ZccgULj
         m3rMEC5suNbakRohKBtnKJHJe422y5xjaKX8TUlYUVTmUB4sCVsbhSe84PizpHlpLaU3
         NmQS6St75iLGRsPVbtfv46kTJ+/zOP6Ywxdca5iZR1FZfdAw+GjoP4qqqdTBDOLoIsbt
         fAapiUMDbnWUuBfOEWueNQMTh7wJSJCIiVF3qgZsXWDyneTl/xRCyf6EztJCz03MAgAl
         RLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        fh=U32j87UPRDPNuml0vgDOuEs5hrmvVQs6W1BIlQP/93g=;
        b=edLDl0mW1+gkQ+u/9hSQ/nj074QR/tWs+AjO5P5e4afeKNs0MGHgB0WQV7+PuvRLB5
         DCAWMoczA/JWj/8Bz+oRRdQQ5cVXV5FA14aDNGXZo+Q/P3QplySCLRNkjo37IiP/BXf3
         UhTuL/dfU0uvMeaAKkM9R+MEcbgT1yAxpffLBsbbwOiSGFpSV5qFyabs/1pKxkICNIxF
         espADBTf7uSWpbegy1sOFXCupYc6eVNdSW2+/uVjZMYPYUnFZVggt5KFNDRDOv8axwq6
         ZKYJrvkIcISz/rift60zqAQrfO1G4KNokknZVkb5tCzYQPkMm5cFk4nOVyKtaCSL53wO
         aKjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050580; x=1792655380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=O0cx1fJ/BDpY7KUOgOuGRDjQHPXU2Sax1fG8UyVch+sPis5isWnLDv1fKhlI82OOxS
         NIfC6XolPitBu+MBvV1+lbhC5MvQeuY4RdH7zDza7wN+PM+j6+X9KHsTn5XfMEVcHs4l
         UpBVMDNrxx8KWwTuYTO54TYGlMumcnqDAs3qSqNtkdiUb7ddZI52uT3FpXMJX65sPiM9
         LPFcp/qfPpW2gu7vMvqb0/okQ+p1ZpdJkIkIp6PxCru0wyxuXw1aX2f87vnqUsOxHTG+
         rv7Hekdck37en3gS4yd5UwKbomrHDGm7JXe7L6XqUwqPdycf4bKkvea9wGCccF/mT7KZ
         VKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050580; x=1792655380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=QEVMSKBYJ4Z5/j3gnXpC0Uz2lCC3jthhmqKjBRHjxAiVSkNAoRfSdNykPI6eHQrEAT
         C0O02BurFkHIiWrjzjIN8RY5tqTeiN5MbTYNYHe9otTH31IoX6O2bEQC2zM8vid4TnB/
         7y2uYEg3eObPS3JZO60cIB2M8C0I9xPvS0jX1QJ3BfZnclZqRQHb78uyOOCno5dpcD4+
         25y61V1VZdoeYtHuNl2E3tVAqOfq1//Vyj9P5dFUbl3dLvS1Szu/OK3oPLThfMeGSXT5
         7iLz4bC+PS8myJqGcYMkQvou2Xfd3AyJRpjUz4I+KEBiMsnqel6sDAK1jlZuWBKdO8SA
         85hg==
X-Forwarded-Encrypted: i=1; AKwUvBzc0amAn2ZmWRq3VKk2QHZedeuUwhQ/1A+aqItOf9JHtYQctaYREiPZYQHmpK+IS08fr4glVXSpaKt2@vger.kernel.org
X-Gm-Message-State: AFq9FYI7wjAvrIJpfpHetZhMuxoLe4CRAC+6W2ncXHbv795s80ZDa6BP
	A+tkk01Fn5kcrtxSFX4kc/KvI5zT8c41CaRWU/MwpcQapfDq1O8vTqgF7qc/mreawehcx9cZFr4
	yCeeXqLNhzOqsQOSjLVcpFfhCu6vEfqBIYnMa
X-Gm-Gg: AYBFou1vSUaFUpxx/mNbFkvz8j7i/YR4zG0aYgXa4TocfIFmxtRXA65dwmuAgoNPyXP
	8QL6Frk2AUQo418WArrUc7sgk7WXHF9uyz39xRK6LoaLZyPgFPjRx6LWsySP/gBPH3SExCbuTXD
	zo8Mdy5+n0jYXN4J/hqi38e6da0jk4Za/w6nbVGsWTmFsMiX+sVhwIJRyfBLJy54n+2UeJXq0DP
	reXVosatodoGUm1iv5wLO4sHC1mrera1YcRkxeocCKj3//ZXRySDuIlnWZnfUC8Zw56BjkvSvCv
	ES0DtwkodxSC4MlnjyH21GIxhy7CWdhFqqqdFyea+2h5zGHKHEKq8q1VV9CEPd5j9WhX2CnTBI0
	U27RG1qv49FDl
X-Received: by 2002:a05:693c:80c5:b0:35f:6d9d:af68 with SMTP id
 5a478bee46e88-35f6d9db757mr1154283eec.23.1792050579562; Thu, 15 Oct 2026
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
 <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
In-Reply-To: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:49:28 +0300
X-Gm-Features: AclHuK_Oo9j5QRqhps9x8wmywtw4oQlKiNMQc_P7VxvfWQOhI0DwxVL2kvoPOvI
Message-ID: <CAPVz0n1YcHwH7b8kg82Gfh7GaT=O9Sx0YEhx9jAGkZ=C1JV_JA@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
8 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> > +static int asus_ec_battery_get_property(struct power_supply *psy,
> > +                                     enum power_supply_property psp,
> > +                                     union power_supply_propval *val)
> > +{
> > +     struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(ps=
y);
> > +     int ret;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_PRESENT:
> > +             val->intval =3D 1;
> > +             break;
> > +
> > +     default:
> > +             ret =3D asus_ec_battery_get_value(priv, psp);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             val->intval =3D (s16)ret;
> > +
> > +             switch (psp) {
> ...
> > +             case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> > +             case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> > +                     val->intval *=3D 60;
> > +                     break;
>
> asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
> unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
> properties >=3D 0x8000 into negative values.
>
> In particular, when the battery is not discharging or not charging,
> TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
> into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
> Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cas=
t
> to s16?
>
> Thanks.
>

You have a point. I assume that using val->intval =3D ret * 60 should be
acceptable.

> --
> Dmitry
