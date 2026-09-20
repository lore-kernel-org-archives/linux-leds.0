Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44933B6D9
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934262; cv=none; b=EuCnxW+2538HNrK47qJ4rLFQCBid1E1Q0fJmRzOzhLMy8mat2YnN59M9TH3XCikbqoJwvQANUmi0uHpf77Yln1M69DvVGt5W9cRMOLxLXOZo61uwd3dxpp6jio1Oo9GmbveFn/oiCTALJFCSjBOX8TMAH47F5vBQoS82Fl6KIsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934262; c=relaxed/simple;
	bh=pHl0HX1CmxlgOxYkD6cGen0pi4uucSUtA8bjPs3N+8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G0vYjtL1fpJ28FEVeZeIVDoGdpIaVkNvPKPQ89wse0itZr2UP8jgYF9xjbrPrl9O69axBNLY+gymHZoHXZPkBJg4i6agHGluTrCsMhbUbw0fQRqTx6XIvjbjROVWb2YpLVdoMr5ywKKnVHA0QhwhR9MDUGsi1jcl9kWBgpGy5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mhvx0abs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mhvx0abs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E711F000FF;
	Sun, 20 Sep 2026 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934261;
	bh=pHl0HX1CmxlgOxYkD6cGen0pi4uucSUtA8bjPs3N+8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mhvx0absWn2GTWjq8iwhCU4qaQOVpHY8zpxjM5du6+JoBsZkO4r4Kc3n1toBYmEhf
	 yuMmbfJwfnA55xlrZ6mtwZYlu08FNHMLtmB1xHV5gzdHVCYICLyDef3H8TzcBNZzss
	 /X+YB3ILSwE/9pjARx+xCu7Gma4vA5Iejy+RYNVjiWQJboHdZ1ZG+JnPzULTdQkzlO
	 JalEc8c8ZGmzNHYznbSUA0Br4q4jzVgndh1CRFDNHb4XPT/j5jkpUu4kcm3BIghoF9
	 yx+1++bXwnrTFhLdxtqhS4d+IYJ1CdPWv5MCV2NSjRGgYQaTrsIYTvTUx4jaEIC91x
	 DJWBK2om8vCmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/13] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-12-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-12-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:40 +0000
Message-Id: <20260920195741.59E711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Some recent models come with an ambient light sensor (ALS). On these
> models, their EC will automatically set the keyboard backlight to an
> appropriate brightness when the effective "hardware brightness" is 3.
> "Hardware brightness" can't be perfectly mapped to an LED classdev
> brightness, but the EC does use this predefined brightness value to
> represent auto mode.
>=20
> Currently, the code processing keyboard backlight is coupled with LED
> classdev, making it hard to expose the auto brightness (ALS) mode to the
> userspace.
>=20
> As the first step toward the goal, decouple hardware brightness from LED
> classdev brightness, and update comments about corresponding backlight
> modes.
>=20
> To minimalize the diff set in upcoming changes, a trivial refactor
> also converts the initialization path into another equivalent form.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D12

