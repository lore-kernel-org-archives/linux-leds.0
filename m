Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A02D877A;
	Wed,  8 Jul 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520851; cv=none; b=aLhuDI8GC3fxHHWEufLKFTI7AYVu0IUIEm9gpczgPXwB04Y+hnn/vQiOtQISMSOm1fum2Bw76jb1I7lXUyuPQNrei9AIyBOH5aCgItRjmjtfNbzLYRffkmLQrfNg+NNWeEqX5TxFoDyGdAGRihzDitUdVHH2Zn1M9T5Q+ri7vkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520851; c=relaxed/simple;
	bh=+j0ktyffp2cjq/8foHIQP7n+VcOjXH8BPaDGKFB2qrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kQ9/ty+wC8rYnqG9CcHp5zXHmZAdSULa0s5O0KSP530uEgvZpR3jdFF6/VjcvYDg1WYW1Uaa4og5a2XUFZ4n6FH+b24eyAm8naxJi0PrSRMtRcOrtfZruS1eL2ThRpuv4NTOpVanLSSNUto0h6z9K43K5c+Sg2QwxiJYKiuEhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1IeKWu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1IeKWu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E9D1F000E9;
	Wed,  8 Jul 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783520849;
	bh=+j0ktyffp2cjq/8foHIQP7n+VcOjXH8BPaDGKFB2qrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E1IeKWu9gLOBuf+BI4l1J2uYQZHp0tzVMU2mdViqAIyPXRBMFYsOkJBH/Bp+zMEWX
	 H7ni0e83U/Wn7JiV1m3S/AcMyW0kHaFduZSYggJGYdQ5kVfu/Zs9/3PuArQYXPQ322
	 WR3JrM68DB6KaDiVbWiDNS+yMefOLXsssDJW7UAx20jHqR5VvzsxRKX2Z78mkTF9ky
	 E7HE8o+IheJmsbKzsVge6g0+VuzvivBNoShNY3zFkF2OkQu50OpldU+btXgr1/liLY
	 UKmBJNyAap2wUovFUMGrXcJ9brZT669i32j5vJdD0J50CmY5Ro8IPx6AuvzdLD3XoS
	 QuprLfw4QvkSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:27:28 +0000
Message-Id: <20260708142728.A9E9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized.
--

--- Patch [2]: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolo=
r LED support ---
commit 30cb94bf03a6bf1ebbdadf9eba002ed180f281ee
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

This commit adds support for grouping individual PCA963x channels into a
multicolor LED by introducing a multi-led@N node pattern to model hardware
setups where multiple PWM channels drive a single physical RGB LED.

> dt-bindings: leds: nxp,pca963x: add multicolor LED support

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix in the
subject line is not capitalized. The LED subsystem guidelines request
capitalizing the description (e.g., "Add multicolor LED support").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D2
