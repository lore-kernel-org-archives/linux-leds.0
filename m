Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC2357CF3
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934255; cv=none; b=Quchqth9kCUvIFl3ELZ2UKIuPXF20g659p1hQ4CYdX/oEcdOE+r3Bqg9IlJxzsCTOUqhrfhtxlh8WtxIur/Yyn/7ki2MyIPQALHTW2KcrcuPWgA8xp39+pu7aV/4UcE5nD7hrtpGOEe58rLuNYXrpodbgENHLgiXktzVkJlRH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934255; c=relaxed/simple;
	bh=Idp8hARAt3RRZR5pgUSfd+HzlNY+oQAUH09Pk6bxQGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J8gtCBiYUOysFJf3/PEQdvS0sESncj267JR2CdJivHdaANkNBts5GF7Q1QBSSgV4I6O3p5LIjSGoGc2dqAFvjy7MV4TBpTtSxVOnfjexO9X+/xpq8ZfDHMVhMt2mYWF9A3k095zyicfKZAGenprhIi7F162xVSx64E0gVRow3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHrubQeh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHrubQeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053C51F00893;
	Sun, 20 Sep 2026 19:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934254;
	bh=Idp8hARAt3RRZR5pgUSfd+HzlNY+oQAUH09Pk6bxQGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iHrubQehSqSeurSy4rIeGun+D5t5kiwsNSJjAVtnnQF+Vm4bTH1EHmG/MvF0B1b/D
	 F7GEY72inmq2Ied088SKBxamc9wJwWeMNGgiPI8CphZx9CiXr0MuW3cVVA3qBtZ7mX
	 wOhYAUZzRHj9T5fpMzftzKcD0rYXjvhD6hiiUAvvc7sHhfBUVBGPHHy1Gs4FH7ihVY
	 PukCkzvzOmKaG27ucWsvNnPtFwWofm9TXz7SaWsHKriKO3m+xp+mOl2ugkvyZ+H8MU
	 SEAKqFGzoc6cHWIwqXst1QHDhkscDOHKngW1c4gLbF3wa5DCMKrb5Q10bjvK/p0Dns
	 6P6XSV0oGDxxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/13] leds: cros_ec: Implement hw_offloaded()
 trigger callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-6-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-6-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:33 +0000
Message-Id: <20260920195734.053C51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> "chromeos-auto" is a private hardware control trigger which always stays
> in hardware control. Implement hw_offloaded() callback with its return
> value to be always true to reflect this.
>=20
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D6

