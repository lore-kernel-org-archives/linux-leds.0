Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5654A5C30;
	Mon,  5 Oct 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210331; cv=none; b=Rvy4wdHVSqOtC5j32bNxrpGfob/6Pt/rqlTKYgkyXRO8uIYR/YNTG5vkXQV60/bOmYcfZsUSXkTbbhSRDD9DW802EJ946/9ug0sDm5ApAZReFM3P2JVENIVvc4ONeeNDJyeJDBDNjaKUkXVSBaS79Rf9XaSLmB+ta/DwPHjMZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210331; c=relaxed/simple;
	bh=tdBsrszPjsS3FMml5YA7qidDZU4A9i/1DhFkN/5Do3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VAdPK0z+HeREiw9hbU6c3tcdVRU53wZ47NffxVDFt4XEWjGcPIyE9vpxSffA+sb8s/gWXt7sjHu9cmZoNsqr77BujbSlgCgbANDLi6Jz6FqttaTiEwD7RYvc46xQgtFcAphkvag7p5n5UM1INsXWg7WqK1RDJO4I8a+WvC4g4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NK6+xxNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NK6+xxNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7A01F00893;
	Mon,  5 Oct 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210318;
	bh=tdBsrszPjsS3FMml5YA7qidDZU4A9i/1DhFkN/5Do3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NK6+xxNJQJniSmxOswmbx4LS5WkqN1NVt8w7H3FN2BWZ8i09fndu57dGO0gXRfBok
	 tbaxfpz6r3Q7E4o5u1PjlzlMH3DG1pxH5ioVAGUJmlSecQUtkoQg9hBbqtWmMcB2bf
	 q6iDIWDxpY/sriwnyq35oHQDIDtAxWTw5DXy0e+Wjxscpwjtl/ypHBt8enFoZx/h1Q
	 INa52nanYmOoHg9TdjBsNmEneKW54bExmRJISZz+X8rR+32S8Q4wTYM/DsVOFwlIBM
	 LQ2J2t4nHcbDI+moa6+uqUXUa+aUX6qKTQq5+Pw62DHncB1UABQzriGAsOpRBmlQpo
	 wsLxOSsRZUcGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/11] leds: pca995x: Initialize MODE2 register on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <c300e9762f8a427d8be5a985228e3317f2b4c9ce.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <c300e9762f8a427d8be5a985228e3317f2b4c9ce.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:25:17 +0000
Message-Id: <20261005142518.6B7A01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Ensure that the LED driver is in a known state.
>=20
> Not all of the bits in the MODE2 register have a function - some are just
> reserved bits that always read 1 - so the values given in the PCA9952/
> PCA9955B/PCA9956B datasheets are simply specified as hex values.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D8

