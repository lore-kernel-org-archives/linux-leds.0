Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC65459AD0
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726915; cv=pass; b=tsZ+4Vp58U8OAMJ3RLjbY6qEvBKrnp8GajZRLzIdhiGsRFsh76ZMdslNW97JhW/J6vi3jHifbWewzXElvll3oDTI4bWR8PMtOfqnKxWMtjkr1XLjlat8Pru5lktUcjf2W3kO8tZ5zz3p0ht6XMGx8VX9me/fORlyF2SAdhyhzcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726915; c=relaxed/simple;
	bh=RPdJBjQS94rIdDl5THsCbJPnrtAJLZNHcWn57qXRaUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ntyf7M+XWyPTOm9UIaHsxEq4F9MFKYj7/Pohc/wxucrIHeZlg5o4CXm+JrzqakB1bZA8YFoyueXwPz69Yf1NL8lc6mmnxq3u8FcraQzjjE25p2cNb/deEocGcObkBBQl6/a8TXECHhdRcWNawxRyUiztLEE1zokVBfc9mLk1wSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvHigOoe; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvHigOoe"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-356b1e20700so1435239eec.1
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726913; cv=none;
        d=google.com; s=arc-20260327;
        b=DAc1XTDioDO+w2Da6ecHa6pif4wpWXA7XYBl8kQ7MsFcyp5SrZKcpaA/cewVrYBbOR
         NnLyQKYqmn93AEMBCnp92VsnZPBIifE2Ia3GM65mMkkpQRwxoqYEzQSQzBkgVqwVRtyv
         cuo+6te35vNbC+RWllp+ytsoanyIpxKGjDf89EuQhScBLQEw5g4DzbUbeaxknrIHdEP/
         CBxRTQmtFOkNGZDTxovBv8ZDHK49EhBaCF0A3cjzJLR+Keun5pIlF3eq7NZzRm6A1pyg
         QwlWHQwOkoNh8DhHEVn+YQbO/hm8UUqUAr9mcHo8Xab+KbHrZucGqNuWbL+Yo7TYsMzZ
         LkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        fh=Yr9ZCuYdd3yxIGUUBv2CB//x33NvalvHXbs5Vfpocjk=;
        b=IF2ICbnS3Ns1TOIgCMQmitkXxFUTsCpk5uAgiSQqUS89MtwB01YZ8XgurM8bNmb1tC
         nq0ncudceb6rXr5lCQBNb696B1u1UEB37jLNrO6k6DIOZQScY0nKVjOUS0rAPb7SaX4I
         LytWNiNHOa4G6Aw/MLDWPt5F+GyfuAyyTWS6p0Y+Gt7rxKsliPpUWjFxK65DGAbl30dA
         bjvxT4qvrDjK6oSvpjShc4e5C/9chQ3dfAO5noIo9Ro2lSLGpwBIj6hnYCl+Fl6/MEWs
         DFflaFeeFixNmWKZZs4chQspYYTlkuV0IRZ//v9ZgqLdTPPVFipro5fTFvbWQi5kcqMR
         4OKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726913; x=1792331713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=bvHigOoeZ42WfySP5kE8X3ncfWw0x5k1rA/B9Kr/zfs8/8wB7RNB9YJyggYWKRkwhf
         Gb0dGSPBCmoHx1rWGZmuzYiv5nG0UwoOGVBqqTuiLrzLHW5v6bIl8iYXT2/y/YWZWMhd
         8PgGeFruFMyU9thriQ+YoQLLHMkpjEMMOrm5oM1Din9bqblFq6XP4gIs3OY3IEWO9dvl
         wCdDt+fmKCQbDt+NWoeAdm4vrhc9GIImxI+x2pjVv8Fa+LralsPFgKybb8yhBuHW1Moj
         zU+qNb67poGcYJ91Ve00b8mK4LBCTpqRzCKSdg3SMhh/iICo5RJgAzVjVd/YbstexOfz
         kBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726913; x=1792331713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzc0OsJfB0tmO67jDz0GOECRwoKeZWwFGcdPRYCLXGk=;
        b=KumU+zGMcIgvbT1BD4cVOqvgLRYC3p76JQ55+75pXBJM/oLDp8yVXXMGRRCkuO980t
         bPAoSxupf4gqZqYcAGb/rUi/Q94LckjgFWL0XPUe3u+4KQinW3caXtnqDSTG1NuuSYqq
         0uBFyT3ytRlN4a+0foBDjpcgixhOD8iKPx+G8wGtvOUXqBbsn4JGGDK+9pQjzKe3JVTK
         VQ80DlHrZkg887FSc+vK2HFO2KSQ6D0W5P8lOZS4xNW1x5PXNxfEDm6DcsK1XBL19F7c
         r41mIwH4CUXKdPZk+vwzVA8UpZ1Ka8++7IFe9AHGgX+6K1UMGFZGXp9OwL+ZIB0jB7Dx
         uKgA==
X-Forwarded-Encrypted: i=1; AKwUvBzBCSD/ahPoAS65TgOYZA3gzCzukB4PCNmnrtqOCngeMA9xudlokgzQYKYM7S5PMB6PTIKVNi3OYk+B@vger.kernel.org
X-Gm-Message-State: AFq9FYL9ggqxwBOGc0Urk2A4e5j+txS0LUtwvCD17BH/7F9WlMk4wwc3
	2U3MhReLm6/lCUXH95HXzAlWQj+mEvoO2Ehp8OzYC+brh4RsDl8rFOOCB2vRTegdSSNwPmCSJN1
	jA0yj6q9c6hIU2OF2jEwi/PlrQ4t0AUA=
X-Gm-Gg: AYBFou32fC7vwe/mW9ixlCDdPi23ZkI5+Zy0GELO5773BLSFIMJ5F8S0Npw7aITZndu
	lRXMyhe+lk3tPyeCdDeK1ebTF2lu44BA+ED+9ZYoQxYBEiQX11zmG0Xvelrxrm2YbiRdgDRpq8a
	fEHDSMDLhXCupcig2GLRdpKORZePCD4hs3hdS8SNx2V06XZa+V9rHk+8LtKvBYtp+gSVsowk2QV
	qTaFSMSisWTP39WUFSY/oBmXD0awjsN84DbNcyf+uJlDFfVDC5ZwQKhL66UK4qA7/aP0Sg847GO
	Kx0tt/0tWM/ziZk9HVfE5VRPjvUTZ7WeOMj8vufo9nwKpd2JX6rHtiqHtpCZv+IYaIqL9tyEePs
	5R0K2rlD47xmd
X-Received: by 2002:a05:7300:ea85:b0:359:fb64:11d7 with SMTP id
 5a478bee46e88-359fb64144dmr1830270eec.11.1791726913446; Sun, 11 Oct 2026
 06:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
In-Reply-To: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 11 Oct 2026 16:55:01 +0300
X-Gm-Features: AclHuK8-aWVSqr-fIGX2d6PvgsPFFBa82zkZg_sbnfasoFphZhxLtr43s7c_jd8
Message-ID: <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
8 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Fla=
sh
> > inhibition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > index a65d92522c9cf..596b5e284f44a 100644
> > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > @@ -31,6 +31,10 @@ properties:
> >       maxItems: 1
> >       description: FL_EN pin
> >
> > +  flinh-gpios:
> > +    maxItems: 1
> > +    description: FLINH pin
> > +
>
> You don't seem to make use of it in your patch.
>

I don't have to use it in my patch. This change completes and improves
hardware description of the AAT1290/1270.

> --
> Best regards,
> Jacek Anaszewski
>
