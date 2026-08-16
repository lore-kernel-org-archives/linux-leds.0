Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C577189B84;
	Sun, 16 Aug 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786878242; cv=none; b=KJTKr3saOPmpqvg5pkCGXGBV1WZ5bsTfDMbkEinXS9KWFUYXQEHqxUqiEYdvjrTXpVqEFfmvQpqzFU9xBDaYUkWA842DkAP9GRCojdSoTiViMz1C0p+qJUFNlGjJjNgXk0BntqAFScMe4YgL5Tw5ICWJbz2C1bJo6NDAxkPxYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786878242; c=relaxed/simple;
	bh=9dASDDZxU/aATZBFp2TVto24ZOzqm9T5n9Eh/VZgRf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=axNxVgZaU/uyDZdp52VJiCBVML5dQrVeEjRpP+tfrLb43t3ZDU8ruBwIJj18cZhLrdrb04LC4gJGirEvL1bEuc/UYuHlPIvlQ9SgNZ1Nw/8EMyj2qvvYdUFb3181k9mNAYNwWOrQjtK0QDGkZyizKddxuOCdH58LWe3lniIoaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4D4hN1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4D4hN1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E21F000E9;
	Sun, 16 Aug 2026 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786878241;
	bh=9dASDDZxU/aATZBFp2TVto24ZOzqm9T5n9Eh/VZgRf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J4D4hN1DuCdx0cRcO98WW4tzTPYX8kxiROKmOpPig7q4dMIs2ztzTkrDk/6H0uPe/
	 no8eCt+Judgfq5NvXPSoy7OjGPoX5LZTDrZDZNXWHMvDnmdN7HfbSo+HtdqD2mQFo6
	 z04mmrcb5mU+ZufkjCP7/VAKjP0y/4/bhqGTsyYPiFct8r1UK/m4CBdT2lb4HeDVLj
	 0FhVDPxtFaTM4f9oSCu4nvQ2R476nhVWM7kw1UEob62k14Wg5LYKgOU5y+x1PPFNFy
	 HjdNbo0o1dT9th9zmn4cRUcErcnqa4Iz+s0AO1QDw+nqI5ORhLi5CCVaTsL0oapJOG
	 IvIuTDSUGncug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add Orient Chip OCP8178
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wim de With" <wf@dewith.io>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>
References: <20260816-ocp8178-backlight-v3-0-caf95c453c50@dewith.io>
 <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 11:04:00 +0000
Message-Id: <20260816110400.845E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add device tree bindings for the Orient Chip OCP8178 LED backlight
> driver.
>=20
> Signed-off-by: Wim de With <wf@dewith.io>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ocp8178-ba=
cklight-v3-0-caf95c453c50@dewith.io?part=3D1

