Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FB37AA77
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643830; cv=none; b=NrmrGU2/vpOQD85nPmBuYFckudQm/WrzMOtqYD0dkxt8eMyis1DO56/K+mnfhGo3WXLGyvOJX0ecSDeQ2Rh8vZC00avTumT9ZeCS5rfnuPZ/IjQcWhRccCB1NNan6fMvNQtNnZMpb4gC3tFMU9Q2kDXk0427xZLs1eyhLs0Pupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643830; c=relaxed/simple;
	bh=YbE3FIEf16hP8H+mbp4mAxHDf1jtRYXry1/q9zHuyWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCqvRcnsCXgaG8CL1fwzQzic8/qOFSQMkYc1upuPOyiXUqGYa7fhvS2Ao6G/dGihXHc8fmmsnjZVR/u+p37UrbLhHEeWJcvoCjfxo6xuXhjVt0h1rMFbFQCusgTr5sVjGuR7cr0cgShxc5I9xqe30aALTKa3Eznc/MXE22ij5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5SmH4BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5SmH4BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F201F00A3A
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643829;
	bh=W872MX1aaB+YZmKQrLunW/vuC3RmxtdDHd9xnW6ge+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M5SmH4BXlce5RIkeR7JLaR+DYcExoVzvJZxY15mNd/86gVy+IIZEAbVLqrabl/fae
	 dRHYHv0Rzwi/98UDdgLJ4BuqS1gyLzWIzptNDaFWK+Lqr4tQOvzEORiwGWoq9w42ON
	 aLwhIFaccqMXjGqR+CeG2FDMEYGEJnC7OUawXHKrMFVq10lNdvdJB29+clOYAM/eWG
	 HRxRXKMzncodK3Y/9VB2d14OTWMgXo5Noi6XuOoAa9VT77n5QlUeLZTQuwymB2aIwH
	 sGfx9HEIW5GZ81KEJESowJn5MqU21Cc8ceB7Wq+0oZnNNhMx7cNaW7QJXIXuDNN12u
	 XFcTxv8DBL0fQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167aa9500dso869076366b.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 07:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3LneGPHAWy51Fe1i5VlX05mwI347V/uTTbryf4fYkcEAqQjG4j3Wg5pxPkqPhgDAMeWvnRuU9GyeU@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3X1yvM2MhG9XfYdJzYMfiQBTpzZkJTSO0pS0oW+22Lmxk9gy
	CQXEMGoGyvXuIgLtKkzMfZvV1ec4H4Olj7d0bYxE9IZ1ob97I902DUAISVkhPjxHvGy7pdtEDGi
	fuo2y+Vig/SzESrYtIfcIBMJ+P9p/pg==
X-Received: by 2002:a17:907:741:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c16b4765b7amr761810866b.30.1784643827828; Tue, 21 Jul 2026
 07:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
 <20260701180553.473121F000E9@smtp.kernel.org> <20260716173939.GB534222-robh@kernel.org>
 <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
In-Reply-To: <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jul 2026 09:23:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEbkPU2oYB2p0vBsq=XdzkXurdDUzZdJDOM=MpENLbYQ@mail.gmail.com>
X-Gm-Features: AUfX_mxEjh-9RPB6Ab6fyhpFd_zD5BN0wQFo33UhJrt5AZbs4HA5Micyu-a_32A
Message-ID: <CAL_JsqJEbkPU2oYB2p0vBsq=XdzkXurdDUzZdJDOM=MpENLbYQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 3:15=E2=80=AFAM Ninad Naik <ninadnaik07@gmail.com> =
wrote:
>
>
> On 16/07/26 11:09 pm, Rob Herring wrote:
> > On Wed, Jul 01, 2026 at 06:05:52PM +0000,sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [Low] The schema conversion incorrectly restricts LED child node nam=
es to `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all ex=
isting upstream device trees using this binding.
> >> --
> >>
> >> commit 6c59295f22b17d02a2b26847db54458f820fa4f3
> >> Author: Ninad Naik<ninadnaik07@gmail.com>
> >>
> >> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
> >>
> >> Convert lacie,ns2-leds to DT schema.
> >>
> >>> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.ya=
ml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> >>> new file mode 100644
> >>> index 0000000000000..679a618906d80
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> >>> @@ -0,0 +1,87 @@
> >> [ ... ]
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lacie,ns2-leds
> >>> +
> >>> +patternProperties:
> >>> +  "^led(-[0-9a-z]+)?$":
> >> [Severity: Low]
> >> Will this restrictive regex cause existing device trees to fail dtbs_c=
heck?
> >>
> >> The old text binding example used a child node named blue-sata, which =
does
> >> not match this pattern. Since additionalProperties is set to false bel=
ow,
> >> nodes in existing device trees that don't start with led will be rejec=
ted
> >> during validation.
> >>
> >> Should this regex be relaxed to allow existing node names, or should t=
hose
> >> device tree files be updated alongside this conversion?
> > While yes we prefer what you did, it's perhaps not worth changing these
> > old .dts files to match the preference.
> >
> > Rob
>
> I understand this. Should I relax the regex to allow any pattern so that
> the existing as well
>
> as new DTS files could be properly validated?

I doubt there will be new DTS files here, so you could just list the
node names in use. Or to just allow anything, you can do:

additionalProperties:
  type: object
  ...
