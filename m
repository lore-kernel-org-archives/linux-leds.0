Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD0390609;
	Tue, 22 Sep 2026 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088933; cv=none; b=Sk6zVOpuqF9wb/clZS3VKYMK8bKDseMpgW5uw5IQQ5/uoqQZncBN7jNm+vpeUJuuBcX71GrZPvt5SkymUkBEHdX2WKLJrnNnWpQyPVHZQzZRXC40Zw1CaFH/79wecwZg2L4jrc/xv1PF0iHLsTF/KnkWOEBC5qfFCzHJNPjkmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088933; c=relaxed/simple;
	bh=JuzZzm7VbyEX2xcNXWX9EwWqQ2LHfuAOqMjRCz2DSjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pAr4shExPM8voxDkQdgWxqT5hq7uxHY+5eszFxSzzwZre++SQzK7nSgKxD6YG4VYxTRE6A9NNRtOY+wMPVA/hYCxdmjiWdr3ytHxM3+R0P9+ZSmKHTa9GE+/GbfWj56xe5jARv2J9H65BiLmEeiWbIUvaxSEA+WZaRFQ4zuKZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH5ntRoh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH5ntRoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E84D1F000FF;
	Tue, 22 Sep 2026 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088931;
	bh=JuzZzm7VbyEX2xcNXWX9EwWqQ2LHfuAOqMjRCz2DSjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VH5ntRohUQmwVpl6jMygmbgkqVWO6jorCCtJTJhyZVhmR8mYVpdqjcD6deT2/3jkf
	 jWmJ7KfF74BLCivY/ikvx6nEjzKFW6Ceo1ka9zocN3aTdP47yqRBs5VbdYaL+Ds67p
	 bumDu31JJHr+UBeCyd8rewczx4/iGFWm2LOeyvw5iZ3Z/mq31JTjbXjKiIaWxt1BPr
	 OSWLRz5r92oZB9YOvyvfUS9ndVtvjOeFPsN5AJ22ggB0o++Q5HrybEMzwlbcv7kMrh
	 nhuZME0Eug18az/B5I3q6xA8/BnZB1kWW/P3Y2Xf2jDYjbQD46h/yQT8n1B9WV4PFu
	 ZzvmEUDR7YADQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/10] leds: pca995x: Add support for reset GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:55:30 +0000
Message-Id: <20260922145531.1E84D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
> if provided in the Device Tree.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D6

