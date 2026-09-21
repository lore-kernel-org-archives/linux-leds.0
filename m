Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE447A883;
	Mon, 21 Sep 2026 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033605; cv=none; b=F2oDk/SfQquYwhvVzvSxeyUnLu/VHI6Q9bvCLNxQp8IrSFzXIVEwrZfGoD1xmT2bhxGDdhBCFp72Xd51+RKuHXTRbnnyR5dDbPOgiW2mqCVu4UReYoJP+sBiSf2+dPPuBTJD4dVcGw2oDaSU9OWOMC4dEWdZaTaz8vvfNK63SjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033605; c=relaxed/simple;
	bh=rPUcZVEIA4jza5Ui5HUvywZOkm+AJz5Za3DCs2xY6tM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GuTk36ia6tyTHsPcbQLnCosf9cM7/5uilzWee4jY5+y6MGpRVPi3KFUXx2cB7E9ap3F1s0MFW6orrzfZu+F1vl7rdeGMw8WSodLELx+V50kMp/chw8BgWnqsSAqZqmT+ZboyyNpiLJSGyaGXbqE4ob1gQaIO/MF+V2d3FHICD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO8Y4/Fu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO8Y4/Fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1241C1F000FF;
	Mon, 21 Sep 2026 23:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033601;
	bh=rPUcZVEIA4jza5Ui5HUvywZOkm+AJz5Za3DCs2xY6tM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HO8Y4/FujTnUDkdlOZieVgY0BzNz1Nw7mo+/YWJIaZPFwPJOlUz2mXwtiV3gw5xgX
	 ryIupquSaGauBQsXhVuXTtqynek9mMt4whrHz3mf0PTA98GtN0spR0vQYRWU6PBEOz
	 2qIn4kNu774nAaimxwetGeU3MtgO/ntJwMkOC57tgLcXppz4FIfujEJorZmfMeVyME
	 UHmw2+I8bqdsEfVHt6TaC1CiNsB/qws/uo5hudufKOC46hqxlO+IPksT95K3c+yqZW
	 Ew+Fc+tRjEEOS1keQPmN9c3X+kxuTVctYk3HNUKu3yrln+iadAtLyFKLec1kmibocZ
	 tcrOPLa80tGLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Allow PHY RX triggers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260921232709.3133716-1-robh@kernel.org>
References: <20260921232709.3133716-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:33:20 +0000
Message-Id: <20260921233321.1241C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The ZynqMP ZCU100 revC DTS uses separate phy0tx and phy0rx triggers for
> its WLAN activity LEDs. Allow the RX form alongside the existing TX
> form.
>=20
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232709.3133=
716-1-robh@kernel.org?part=3D1

