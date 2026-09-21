Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C14078DA
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975865; cv=pass; b=Vjxk8szhtOv9jBFseNvaAUbz61+ZH/fVLhN4nxSKC3HZQd32ylBC3PpEz7x6D9hsNO/cZaxQtbSrzPYgd8W2ur+PbWOjjfkEyIBwM3BkPzvA9EPbeMNvy1t4/2qVIenQARq3q2ALBJsmj29s59sYHs3laUvnWs+oN5e8hUFumQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975865; c=relaxed/simple;
	bh=+kodcrZ7Rfq3RbtOm64zvOegmrBogr+8Wwr1ekULfyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyYEyaQMZaEmdtX6PIACv8BwS4Iesv2Jsbmh0/j98K7YLT08nZZ/vvx1w9Rrl1W4EWooRvTvXQgEZ39NDtQnGYehjzCMq6R8vAifYlmU8iIRe5hIzvudva1WlX/tnXhDCP3MxxyXeGCWitR2Wmj1dCyg+YCf9HmMLDPeUR/wfYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD1gc/W/; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD1gc/W/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1363174b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 00:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789975862; cv=none;
        d=google.com; s=arc-20260327;
        b=d1QNybQm3IotiE5aZ0RLTs0VRY+eRMwn/EdeJSiQ3VhQSTOPRbcB4sqmqlU/GuGH/x
         OgwDXt/4B2suufNNCgOkrfkv9/25Js2/+OikY6I9/7pJk0JJK11dggSLSCKZO3XBPBf+
         1RkcoUnCR8xJpTYKbOJ+sf87KUW0xc/oVeLsSZ/x8n5e11LgEpKO8UQum9czNTHbMoB2
         jiySlsiYw6T+beQ3z3e9CWscLpzP93+DALEnu7/zA9aYjvdUEsd/e0O7yG2Nx4IBvwSb
         trhqA1RQY5Qgn6mcjgDeGp+A3mdnalCSVFTpt9ZiQp3yPNSwmShRrvllzXD9NjfUyWw6
         beeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        fh=0EVLGQvGawrF0zsUIWUX4FIBpFfmvsrfouvJFvxiCSA=;
        b=MWFLtbsQ/zPr8HC4GxPlHM8cEOUXzNrCUSVBRNzJ+XJfuIp+XWng1lwvgU1DNRd1+x
         oUKxHhfTvzuX8pydJ5SqelMGt4xqm7PIMz+ZTSnFst836H+oY2AJVyoXhQJIRxSJpWCm
         2s5Wl7NlEh7fJSklqiRnEAxyXQVXiPriIMcpsHWm/5zi06/fhtfqj9x00uW8WLeZqTZb
         5Zpok/yUF2prEnlNPlUiHnxHhEa7pyN/5j6L/MUS0Xtqh8brhoUdrCwWTpI67s5B9Rpz
         x3gduQwXGqHSXZPbFjajdrmWKTh8dzIfVZEf8KczEf+7pCNJu6dtpYWE3gu3or6BNnuV
         Q7mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975862; x=1790580662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        b=jD1gc/W/eQYVqx+yirVe2qcyxe+donWRgWllTIa+7VE9+YQJpmeal1Rk0LOgaDcry3
         CuOI/JxJJI52Wsmu7eYoX1vkz5XJvFN+BfSEzY0Gn5YGMnZZ+WpXeMtv/PCNa3YpWlo8
         s9hlAknJ3Qs1c0R42qcLm2LyzNL24XghGRMB1PXSn54MvoQOde6Cud7hsfyOlSGdMN9n
         8FJXDNTZlmmR79EqWzI6FBGzPfCGDgiRg9UWmYQl9dgfe0NzixXKlHk5TC/12PLNK4zS
         RbqumxQSe17kO1x8LDxXCTnnBqvxMkz+ipuP2SCD7m6l6cbkmTgd4ow7pTU+7NgWu8UD
         wPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975862; x=1790580662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        b=t02k9xbqJ7njPLkdBLAjnwor/6Gri5RldA511Htw0I0RAJVaODmGEGxieSgKzY8+yg
         /27X4QeZVVAydjDjMZ2jXalLQ1ZdhwsFaD+0kSv2xsVAohhcPlNuaEElTG0i8lthmTbK
         8JBFSqyRGE8GuP2RPOOfbPmPD/dAlWnEXfyj4ySs2wXEcYOw6OMEiNcFXDAS1FrOKV8+
         9ByumVV5BOmCCRkZvOA5B24kEMX513ifbg7aebjH8cp6CZ8pn29RJks2n4gEpv0/Ugrn
         xx2fUG8FDkkB8bTvx8kFzt28vQ6sq1ERIL/TdOrq6TkAS9KC6lDxV9JKPGoP0w9maZk7
         oVcA==
X-Forwarded-Encrypted: i=1; AKwUvBz2DtlIyCihclGbDDIUFd4tkjrSyGXmKroeL4nR9KWAHnC2rUyiBackWQK4IRm6z7HGxV2oNUdUr+hF@vger.kernel.org
X-Gm-Message-State: AFuF++kB9KkI2812gZjVIWCoSMWb6iQ4XfM9JxKQQPnt+dU01lBca3kp
	S/LHO43cd5lvZPRNQm4cscumnPZ6IkPGiEk/IeAlzohJcwcjYQojZv8tfYG9k0Z0tSu6T8EtTSJ
	lNjCrz69avEg+zKzWFYz5+W9cQoYTVLFPs2Agw1A=
X-Gm-Gg: AYBFou0STKEZeLDzAK6uYPNyzWvq9zqiVZmLJC30hGp/yyG++izKeUnNTOhWQNwp11k
	Nux+j/TEZtirDeIdy+BsTst2bjTmRPultadcxTGszWyQsjghq8KkE+zSMXTkeFwFm5G7CijwzVL
	JySu6egTZS6aYu4ItXlqsjw2l7oinTPc5wUBPxCLx6SKxvGqUY1RFBpXIzHA8dVT77LgDXI9YIX
	EA7KLQw3QWR5W/kk8LZusOrV5UvGvPwhFPfrmnc01iSUHecnEebj9UYkMFkKPTQtcZ6pEmytsuH
	6mBFX5L6+njlxIN1DCEWq1sLKZVSHcOiz49C6yDaqRE7BQ/9eKAJkPLWfiP/kNRfKmu2TjfzHdQ
	yltKEAI7afTn7
X-Received: by 2002:a05:6a21:6b05:b0:3da:c2f5:a2aa with SMTP id
 adf61e73a8af0-3dd8c3323a9mr17128224637.18.1789975862197; Mon, 21 Sep 2026
 00:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <20260721095654.429346-2-clamor95@gmail.com>
 <178463529533.2776661.17291216407355479584.robh@kernel.org>
 <20260909162654.GK2133376@google.com> <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
In-Reply-To: <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:30:50 +0300
X-Gm-Features: AcwNN1Xwan51ardBlULGfF9_kTLOoiJJ0xUxr2pfFDkGmuB0AEVFXrA3aSj0HMQ
Message-ID: <CAPVz0n2o0OYFWsoXrYXcoAPNz2L4sKi2=JvXPdQzfvha1mOm_A@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
To: Lee Jones <lee@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:50 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:27 Lee=
 Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, 21 Jul 2026, Rob Herring (Arm) wrote:
> >
> > >
> > > On Tue, 21 Jul 2026 12:56:48 +0300, Svyatoslav Ryhel wrote:
> > > > Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TX=
T to
> > > > YAML format. This patch does not change any functionality; the bind=
ings
> > > > remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
> > > >  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++=
++++
> > > >  2 files changed, 42 insertions(+), 29 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpc=
ap.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola=
,cpcap-leds.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > >
> > >
> > > doc reference errors (make refcheckdocs):
> > > Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.y=
aml references a file that doesn't exist: Documentation/devicetree/bindings=
/mfd/motorola,cpcap.yaml
> > > Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt ref=
erences a file that doesn't exist: Documentation/devicetree/bindings/leds/l=
eds-cpcap.txt
> > > Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml: Docu=
mentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > > Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentati=
on/devicetree/bindings/leds/leds-cpcap.txt
> > >
> > > See https://patchwork.kernel.org/project/devicetree/patch/20260721095=
654.429346-2-clamor95@gmail.com
> > >
> > > The base for the series is generally the latest rc1. A different depe=
ndency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up =
to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit after running the above command yourself. =
Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up check=
ing
> > > your schema. However, it must be unset to test all examples with your=
 schema.
> >
> > This one.
> >
>
> As you can see only complain is that reference in the leds yaml to
> Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml does not
> exist. All cpcap cell bindings were converted one by one as separate
> commits, so this is natural since motorola,cpcap.yaml will be
> converted last and patch doing this is included in the series. It does
> not bring any regressions in yaml and dt schema checks.
>

Hello Lee!

Is this explanation sufficient? Rob left his Reviewed-by to all DT
related patches of this series.

> > --
> > Lee Jones
