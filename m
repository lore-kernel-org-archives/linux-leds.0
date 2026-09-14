Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C237CD2C;
	Mon, 14 Sep 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375508; cv=none; b=pwANKAsbqtYRzXMaJ7Mmeu8dyqycYsgm5Osx4fGu5Ax5n7giOYqwG7sXR7Co3fZJJxwNPTnja2QXuBTxAatZwzu4/yQmydhVOCKE/4kgVF9pXhT5k5grzksTQp9bOLwQfvlNJN8Mmw7MKgMkmjLZxlb8k6NdwHDRB8XgHWXF160=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375508; c=relaxed/simple;
	bh=8QeRlCqAjJ8EwhdQNeaHy3qTLWL5VNSQvltXO9KH64c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IpshQHn+sM7Rd5NZlkhF//h2hrz4ykAqoUui8x/ulP7t+2NL3WQPzrcVjiWospxZvWtJ5Fb49HOZ8xtuCllLa9QGW+VIAnqga2Y9Q5dN1TU5tty7+9NsAuwDaiEUOkCLVWfDYlHEfskuf1O592m9afJvNEnBzjvBCTDUv9i1ArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oXxE50Xp; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oXxE50Xp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4Oga6kynJatjXzIzded2ZK3xQfzefluemmgp053xo+o=; b=oXxE50XpvUsc9+1sShx9MKy8G7
	ZaK3mQH1NmG9vpdk8rY34b8HtMDKjYJXL5nPxqJmUFqe4yfqMZQg9PBytZfGeW8Osv7jZAZ8JQLyo
	F7+QMS20iAEH4mBl8wul861TZSwnxh4nbeO8a7B7gCzuA0K65c+8n7IlH7kwIzActt3YtJWs07F3Z
	ny/79WmP4Z4dcIyfO9PHDiTxMPLh4EsrRaZq3ct1UkXMP6xWuIXWQ6kePyP3XvDFC2ivmQ3x9IFiz
	pVnQC5FPJkC2wn3fXqaxcGn0TE8uXghpn6chXIW1D95CAyKvS6k9G1G+paJlVC2Lob+NrRur1vAbk
	I/ooo0AA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x61yd-000OVW-35;
	Mon, 14 Sep 2026 10:23:47 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x61yd-000Ffh-0P;
	Mon, 14 Sep 2026 10:23:47 +0200
Message-ID: <31aace01ed19712b2984890adf61144a80cf7f42.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	linux@ew.tq-group.com
Date: Mon, 14 Sep 2026 10:23:46 +0200
In-Reply-To: <20260903-sophisticated-magic-fennec-7c8aeb@quoll>
References: 
	<6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
	 <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
	 <20260902123105.11B171F000E9@smtp.kernel.org>
	 <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>
	 <20260903-sophisticated-magic-fennec-7c8aeb@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28123/Mon Sep 14 08:24:19 2026)

On Thu, 2026-09-03 at 15:09 +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 02, 2026 at 03:10:09PM +0200, Nora Schiffer wrote:
> > On Wed, 2026-09-02 at 12:31 +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> > > - [Low] The custom, device-specific property `output-gain` lacks a ma=
ndatory vendor prefix.
> >=20
> > Probably makes sense to add the vendor prefix, will do in v2.
> >=20
> > > - [Low] The `output-gain` property incorrectly exposes a raw hardware=
 register value directly to the Device Tree instead of describing physical =
units.
> >=20
> > According to the datasheet, the LED current is calculated as follows:
> >=20
> >     Iled =3D output_gain * 900mV / Rext / 4
> >=20
> > If we want to fully describe the output gain using physical units, some=
thing
> > like output-current-microamps and external-resistor-ohms would work. Th=
ere
> > wouldn't be a meaningful default for these properties to describe in th=
e binding
> > docs however, which is possible for "output-gain" (as the driver just s=
ets that
> > to 127.)
>=20
> Output current is already there, no? led-max-microamp? So basically you
> would be re-describing it... although I understand that for your case
> you need two properties (also the resistor) to calculate the value to pro=
gram.

One other idea I had was to treat the output gain as a single value, but ha=
ndle
the constant factor in the driver, so it defines just the Iled * Rext term =
with
unit microvolts. This could be used in the Device Tree as follows:

    /* Configure an output current of 15000uA for Rext =3D 3000Ohm */
    nxp,output-gain-microvolts =3D <(15000 * 3000)>;

Two notes regarding this approach:

- These "microvolts" do not correspond to any actual voltage, but the full
  "microamps-ohms" seems very verbose.
- It is unclear to me whether using physical units actually makes this bind=
ing
  more generic. I have not worked with other LED drivers, so I don't know h=
ow
  common the concept of a gain that relates the current with an external
  resistor is.


Opinions?

Best,
Nora


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
