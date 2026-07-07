Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A06434E2C;
	Tue,  7 Jul 2026 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441164; cv=none; b=KBxiK0ZErtuDJygPbTAAui+A6EaZDIeUKhNj3TTHI+AgPltz7mRydGTEH9MDM+cpZvQeDEtW8WiEfXHQSpVy9rJPMntpupUkfEL3UDuX960fQCrO+sYXP5DoocVmvXJQV1/YWU5CfCSNxqCZqf/27l+mwShveuxUMSzDTM2Vj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441164; c=relaxed/simple;
	bh=r/WV+1AM9CAJd99NwXYSLV+fuIJbi7qrwMD2d2330Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShhbAqrl7EnTuS9GZPnzO7aLvWW22/G9w1Cs/qrwLNmNhCsuN5V4cEAkmMOaZZ3c+kIJNovb6pOd8wK+NJBU7+ZQvNPXzSSwhUZWSSAu6L08AIMFcKV6XAEjAF3sMvj+06qplmWXR/azosRBiylFZB+vtB0PpxLcKnftO8YaMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WErHPRd4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WErHPRd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE7E1F01558;
	Tue,  7 Jul 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441163;
	bh=Pe5c0lRRYuehiikG2q/D86iz7XJppM5GvK+gT5FGJ6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WErHPRd4NVutyTsOu/YGaANkh7LNzzdntLiXzo4T+7OKglJ+aCD3wRS3BuKVSnP3f
	 9o0OTrY1YBAjFgEpF23wthcqVYvc74eK58wqf7AF1nF0SZj/LpSZ4B7sWP6bdpNW5C
	 R1ZA+pesnMVHABwcsGr6AwUT5JzuT9LPGoA7Mf9M7rjr4qF3I6yO2wHCuHsJMM4a4y
	 wGF2no8lKK5gw7usIk+Cfw5pe3raWpMHjSSCj1b/9gfCvWZUy8Pxo/ZCIy15qVB9g9
	 iquse/r9vyR6Oal5vdmMws7m0pRCRzP+igAMzFu+jA6ycjCJgPDcv79MlE0NkpKPsE
	 14RHIuw0HncuQ==
Date: Tue, 7 Jul 2026 17:19:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Message-ID: <20260707-spoken-anemia-68fb54a6ab34@spud>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
 <20260706-account-harsh-093c6354bca5@spud>
 <CAFEp6-2k1O80iY9f8WeoHHRZPMdKGcOTYuEsDvpZmZZXTz3xbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6c5OipnhGJoLhAAx"
Content-Disposition: inline
In-Reply-To: <CAFEp6-2k1O80iY9f8WeoHHRZPMdKGcOTYuEsDvpZmZZXTz3xbw@mail.gmail.com>

--6c5OipnhGJoLhAAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 11:03:44AM +0200, Loic Poulain wrote:
> > > +        "^multi-led@[0-9a-f]+$":
> > > +          patternProperties:
> > > +            "^led@[0-9a-f]+$":
> > > +              properties:
> > > +                reg:
> > > +                  maximum: 15
> >
> > Is this 15 the maximum for all devices?
>=20
> 15 is the hardware max for pca9635, and serves as the default for any
> future/unlisted compatible via the else branch. Per your comment
> above, I'll move it into the non-conditional block so it's enforced
> unconditionally instead of only through else.
>=20
> > If so, why does your regex permit values greater than 15?
>=20
> The unit-address regex only validates that the name is well-formed
> hex, and not the numeric bound. DT convention requires the unit
> address to equal the node's reg value in hex, so in practice this is
> limited to 15.
> This is again a copy of what the yaml already describes for other
> device's constraints. However, I can tighten the regex itself instead
> if you'd prefer that approach, but that would make the yaml a bit
> inconsistent.

I don't see any value in the regexes permitting things that are not
possible with the hardware. The + should probably be trimmed from the
existing regexes IMO.

--6c5OipnhGJoLhAAx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0nBgAKCRB4tDGHoIJi
0oGuAPwIlUU6nZvmDo3hOAwp6hWklBGrOjVFR3rsxGvoK3GMvwD+P6VMD80XnmH9
dgvz6wHIaSdmzAIz9sNj2yqz4sdzMAE=
=j/LD
-----END PGP SIGNATURE-----

--6c5OipnhGJoLhAAx--
