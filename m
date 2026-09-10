Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526137647B;
	Thu, 10 Sep 2026 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084453; cv=none; b=nkYeWZ3pKzujBfAF1i9FTn/Rhzzfl9DkijFFrga/wA8N8ceiDVoNac0uNHs4wBG++3g3EYao+JGQYveveopaDH/prNU3l2GDO1bBlAVHDDtMoCXXlHXNLiwuhaILRHMJ+bnMDrQvtqLzJkk9mc9LXaEFu0ZZT0HKx0eTqZoNOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084453; c=relaxed/simple;
	bh=81X/hUEZjHrDMgGvK0PbLyEq95hOqlcfU4dG2u+t1Wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u0EqT6hLs507N/WXDufZjLr0Y+DQNiBZySd3pJT5Wu8J4MbcAPKqNALiZUYQy/fp30m0M08Z/48jiT8Vk/3q8Mz8qanDf7j9MMat2aHPTZCOOLz5oCe8onplUbokOMioVuOMKoeRpOPoXKL14OvSWVZ+B2wjOh7m+BVApImbCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqrqEZjy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqrqEZjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F0B1F0089A;
	Thu, 10 Sep 2026 23:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084451;
	bh=81X/hUEZjHrDMgGvK0PbLyEq95hOqlcfU4dG2u+t1Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hqrqEZjyAab/40+6ME7lI8VARMA48w8lwHz63g9WN2ySjM8eB6KqpSaCF69QakLyM
	 umqT65phx6o3mp6VFbnSM25c5U53PtwECZ4bwCwPQrbUopxClCfCH1s0ItJpQAlLb6
	 Ta+zARcWOuGEjJhb169xRiZJVulHlGQ+dAgptwjyz7AVwucep8WTdNTD7aJJ0eIuKq
	 1vto/RYapL1h+0Biuo+tLezOvsd++8GHb+Z0xXuJJmpo0ZWCid90K+LrAjdOINS4R8
	 ahlYW91nTbysPtFasfV8j0uVdGMwKhEXHeWJlvf04v8evebENMgt9uotHNigeglC1B
	 NOUzTjoH+YV+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/2] dt-bindings: leds: Document LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-upstream-ltc3208-v12-1-9107f5f0a7b0@analog.com>
References: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
 <20260911-upstream-ltc3208-v12-1-9107f5f0a7b0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:54:10 +0000
Message-Id: <20260910235411.61F0B1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-upstream-l=
tc3208-v12-0-9107f5f0a7b0@analog.com?part=3D1

