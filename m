Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C650B8DF
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782376; cv=pass; b=oMSMLmLFof85c1LXA+EKWQhPn3GKVQFgFfr1g+IUpOoJqx8DEluIe/+NhUPRmkWhJE+PtKO67E6nUaaP/pHMSPc+ndJu7Zn9rQsmDAcAEJffFBUdVQKQdWaiJ9J61UgzOYTeQlw/+y96Yc8fiJIZsQcvjFXKTjZ4LmMsKz7ZRZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782376; c=relaxed/simple;
	bh=jKEqTeivdQOtCzgWSJBttzXJT/4mH8xL3yRAI43cdyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy23CwsasGMrx0395rDaeVPVobG39gW+uSVXh0KpXgzMO5QcG3hKFCHoMM5/hKknqWRs+jvcjKANPtz8WwYesQT0l6Gk3QzdQAErSuWazrdE2BkBmblj3jwAv2IRdEjKLgY3g10IiD7X2BilE0Ovrm6tHA7ZuU4TOAgdt+TwzhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B663guFB; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B663guFB"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso1132756eec.0
        for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 08:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790782368; cv=none;
        d=google.com; s=arc-20260327;
        b=RSaosMHuD4vG2cl8s9oPn8rRD5cTpcOUJ6CKppruZpIETRTHYw/0IRzebCSRFWmlsm
         Lg9WeZqkf4vsdcQrM7wALRGHt8PK7rF/10VXN8upI2ipW3r220bceD/Efx4b2Mpevf0F
         cmIcUSXAMXHVpD1vkyBq1w5k2I11oGGj38u+3NXW70sVjOL6u7xlROGlxh4fyqLVoq+U
         FGp+S10WF6xXLL5gDrDTIpDYLiLgpCRqdAHugbhWsGS3gNWt3BRTOHTD1J1s3lH8FOkO
         j2jIyCNR5t/beiK5DOY9FBEqaN6Yk0GyPnaRM53iD9MIYaF9/DjFRYi7fJVwIrzS8KRr
         Fmzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        fh=Tnu8XVshKleLWi/9suwmEUg6zY1lGKxu8+irpeVQGJg=;
        b=ML50YC1C2NfqalaLEKqCA5ifj737Lnlvc7AhAJkY2yaK5nc0rbChpl9C2laffnsTuF
         8slJdlNXjdTJVdUnfKdMi1WmRxkk2SyXvdMtiZvpYQp7RxSAugojTfrN3nFakqRurquf
         ygRP1oylrD9FMzgs7BH29imQ+tJIs6ZOjuHeG6ni1sSjzVvcYFW75SuOP+Mr9qtcfEHu
         EhW+m6uxuQb5u+Kr2qhvKRqxTvVslx9WHbz5FCQdBHO8q+rVoCeQ5VdfZ7B8QViz+eIT
         EIMXCkCbvIbnRS7YRVfnr7elmhGa/YGQ3W5hhTqAGU/Wa65Vaw5Ok6thPnlpqpYQmhvE
         hg5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782368; x=1791387168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=B663guFBvAqOW8MQAMitn7yoJ48tDTJS9uvlodawozzZs7l/gVANa+uP2eh9dNWShq
         uKCqvYnAh6br8vgkgQC8qp7JgApeW6R7fN/oLDMga3t15MPSbBVqmnj1h9vBjE1/1LVB
         qyfoAa0sUzxngejtzo49A52hrkgSCz6i4rb44eofw0RFTV84xNPSfg65v5x6s1QPn6D9
         xaP8pJMh3zIy6w1vkJyk5XzpubgMwTDky/WTSZXsPggT/tyQKdYTbwszXP6jeznfY1L6
         kU5aZs0E30h/jFtseYPL4XDi1gAE7lpDxWPggElTaeLRm3Ucp3lr2W6pC6Yt5cKs2r5x
         Wt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782368; x=1791387168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK1JnZzFiE5fXbSTY4wiMnAtq9uq4MENuSG4pb38ZMU=;
        b=z0yaZXA1jx0Z6tWpwBPBvLy9vzLBhOLluJzRFb4plgh60pcAkPpcvZoHPU9L4mVC9v
         UP0/pxotlUNKCp4sMT7Opf1LV011X5jtSyUIzozNBwXTz2EgIh0qsRMbZGXFqY4FFfYC
         UEVneFwvBi+CuRZ+z4NuFstiSMnMrQcrcavoc0uMQSJDfesKWeJk5s7x5/eIuXRdfDSV
         /CL8qh9bIRmRzBw+mK6Ol/LIBPgvHK+VSi6tV8OWgRrJ0aItVp/l2HDBjjSp7Y7pVtZq
         VinPuozM/2rYE3dzYrC/ro96WUyNhOxNJts6JzjHRa8MMFhu+3ZU3ImKDoYHSNAo+xUO
         3a6Q==
X-Forwarded-Encrypted: i=1; AKwUvByUcM10EMTIHmdNbq9KuqWb/KcY6FpNo6E6Waalp5bGBtFDy1alcEPkbsi+X3oVmWhPzARUHY8nwEE5@vger.kernel.org
X-Gm-Message-State: AFq9FYJD66sFY6m6m61KzzcDI5Cls69zM6jS0gmCysbUb1p0iIm6wTUZ
	pmhXIOjLF7bPMdKt1DXzLis7pN/lM6opedxoZ8UwuNKVQaMI9x+73xfXatjjAvFoYv0OQNdA5Kd
	3y+LPMuxnmaUsK0HrBNAmdi7jUm/R98M=
X-Gm-Gg: AYBFou3ihxTl977Ue0uf4ELmaNKtxe4iYGx8BAQ0BpJVoffRINWckHvC+cDHIYj8QzP
	88oDaJOwqEVUs9AserblSTNDPULemQ6vOjab9Wej97PFPYDS0nkkVI6uPKkrgKrNeLACehImnDx
	dbg/y3I73+RiTLAkSSjSgQ5XrMxJXHRhe/r4HOUryHUnm8HK9IEhktQe3EwTB6//4q6Un+n88ow
	eaezGbR0XvbUZCVfqKcsizvOvLYWQpq09qX4a6KABbUhKREMI71425qR3NmxsNjbMAJl3nodhf9
	Ihd8QEcnlXaRPRC0wmvztS3qI7R90huXwk4XND07hH+eDBs/f8xhGd2t+pNr4BaOEAsCC3mLglt
	+GrmS6kWm5USlrA==
X-Received: by 2002:a05:7301:4e4b:b0:34b:fd9e:ad4f with SMTP id
 5a478bee46e88-34cdc4beddamr2091392eec.22.1790782367990; Wed, 30 Sep 2026
 08:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930072732.66578-1-clamor95@gmail.com> <20260930072732.66578-2-clamor95@gmail.com>
 <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
In-Reply-To: <c0318145-a999-43d0-b0fd-231256a89005@kroah.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 18:32:34 +0300
X-Gm-Features: AclHuK-_tulOAdDAmKKjx8njVHGh0FQ7Ovbfd5JZjEuw69vNm5JUgMfqqvzwGzM
Message-ID: <CAPVz0n3DseAutXOXAmD0mkmim-zBkYrW0qTyxXjwQenYW+GrNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] leds: Add driver for MAX8907 LED cell
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 18:02 Grif=
fin Kroah-Hartman <griffin@kroah.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 9/30/26 9:27 AM, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/Kconfig        |  7 ++++
> >   drivers/leds/Makefile       |  1 +
> >   drivers/leds/leds-max8907.c | 81 ++++++++++++++++++++++++++++++++++++=
+
> >   drivers/mfd/max8907.c       |  1 +
> >   include/linux/mfd/max8907.h |  2 +-
> >   5 files changed, 91 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/leds/leds-max8907.c
>
> Sashiko said this does not apply, what tree did you make this against?
>
> https://sashiko.dev/#/patchset/20260930072732.66578-2-clamor95@gmail.com
>

Hello!

I used tag: next-20260918 on top of commit 3f2425f5b5bbb

>
> Thanks,
>
> Griffin
>
