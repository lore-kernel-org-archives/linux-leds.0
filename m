Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E949B21F;
	Wed,  2 Sep 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354616; cv=none; b=fnqpyVVrXbk+cJQyW7kSoQUhwKI4fgfAk5I3jOcOnbf/wLjhfkp9faWD4vEbGxhpTX72urVJ4l+3LWdxhiI3O04awXPkv5yi5asTBnkqfxEx8r1kGkwONK7qLqw5Yh7Lhvl+BtZpLYpNY5uoCFssxpwWAFUqGj2x5Kc6v3qSCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354616; c=relaxed/simple;
	bh=VZ1aSpCeMrLXLXlIbesAwGCaSlwKwM4rCt2ADcuLNRQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I7CppAC6jD3LgOhlBHwRTUZLPuptG+TVn1RNPYI3APMNdqCDJSfLPzRFL1b/p/unqy6uCkOWKt9pLcLkQlxgF+pE3PUPsXRoc83naQNpDU8AFGpYOz6tDxsl4PlEThbgg+MxS1LddGbGrywK/sBa6ItPMQxv/h7qqmr3QsGfYqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aKn2FLx1; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aKn2FLx1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=if5dOSFSoo1f+35186xMX0xtar1esgVkjO+bmUhfl9o=; b=aKn2FLx1R0vvrK5nIHU9MhbO5S
	9znWoRlRDncy3v/8uQ9QzXqfnQa4eqs5A+j1zGGs0MLgENiek9eFq2ldDADdGV90BWwUMx+cHBY3N
	/B8ugc+D8PaZ5ZM8WtTa+7bNBTYQIpupv1SmgPdZ476m2/r0NBAxv7hFfHC0rabgBHMBUIv2U8Jvj
	ksvoaVcPl4hT6c9UW1W+x9b5lizX6mUMwogMyJ9SB3qS5TiZxGNSNkbhrS+Fd4iUPAVzXb7SR/naD
	n0zurOAK4oLByzsiIoa43tWx0c1TzFLSOe/qK4xEDsxA1THJ9uyck39pBYoxEg4vS/EsC6DSmNWbZ
	/8JsA0pQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1kjD-000IRb-06;
	Wed, 02 Sep 2026 15:10:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1kjC-000JEN-2B;
	Wed, 02 Sep 2026 15:10:10 +0200
Message-ID: <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 lee@kernel.org
Date: Wed, 02 Sep 2026 15:10:09 +0200
In-Reply-To: <20260902123105.11B171F000E9@smtp.kernel.org>
References: 
	<6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
	 <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
	 <20260902123105.11B171F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

On Wed, 2026-09-02 at 12:31 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Low] The custom, device-specific property `output-gain` lacks a mandat=
ory vendor prefix.

Probably makes sense to add the vendor prefix, will do in v2.

> - [Low] The `output-gain` property incorrectly exposes a raw hardware reg=
ister value directly to the Device Tree instead of describing physical unit=
s.

According to the datasheet, the LED current is calculated as follows:

    Iled =3D output_gain * 900mV / Rext / 4

If we want to fully describe the output gain using physical units, somethin=
g
like output-current-microamps and external-resistor-ohms would work. There
wouldn't be a meaningful default for these properties to describe in the bi=
nding
docs however, which is possible for "output-gain" (as the driver just sets =
that
to 127.)

Best,
Nora


> - [Low] The commit message description is not capitalized, violating LED =
subsystem naming conventions.
> --
>=20
> commit 09d8712f125575e995a97c0a819c386e17eb766a
> Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>
>=20
> dt-bindings: leds: pca995x: describe output-gain property
>=20
> This commit adds the output-gain property to the pca995x device tree bind=
ing,
> allowing configuration of the output current to adjust for different hard=
ware
> designs.
>=20
> > dt-bindings: leds: pca995x: describe output-gain property
>=20
> [Severity: Low]
> This isn't a bug, but the subsystem guidelines for LED bindings specify
> that the description after the prefix should be capitalized. Should
> this be changed to "Describe output-gain property"?
>=20
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> [ ... ]
> > @@ -36,6 +36,14 @@ properties:
> >    "#size-cells":
> >      const: 0
> > =20
> > +  output-gain:
>=20
> [Severity: Low]
> Because this is a custom, device-specific property, does it require a
> mandatory vendor prefix (such as nxp,output-gain)? Exposing it without a
> prefix could pollute the global device tree namespace and potentially con=
flict
> with future standard properties or other bindings.
>=20
> > +    description:
> > +      Set the output gain controlling the LED current as described in =
the
> > +      PCA995x datasheets.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 128
> > +    maximum: 255
>=20
> [Severity: Low]
> Do these constraints expose a raw 8-bit hardware register value directly
> to the device tree? Usually, device tree properties describe hardware neu=
trally
> using standard physical units (such as microamps) rather than tying the v=
alue
> to the internal register layout of the chip. Could this be abstracted to =
use
> standard physical units instead?
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
