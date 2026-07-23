Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29126494A07;
	Thu, 23 Jul 2026 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809639; cv=none; b=awXrlS2E1shCSSB89iNYMm+o0Hsfo9bBGn/vptBuvgzmyncDcx4Iwbsx2U3KG3cOG5v3FdPmcXcrVpKqq3aR1DAHCkxHvZdiWREEz5zF40ypMxDmCE6MmaLC2DHjJXZY+nlfsBPTv8DmiEAtlBaG9VfaWamwbcMYIx/+S/y0r1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809639; c=relaxed/simple;
	bh=4iOWovUePbuL3fqSCRb54/rBL+51f/sa9w0t2QmKF6I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEeISQQHbN3iihRYWYZTXH/jEKbwn4E9+577YM3rKbyH30fONfMrRMl4BadtThVK1mxN8ySKlaoaobq4Jzi1m83IK1tfpPwMJPBKQzKniijTxRo3f2bOCwDkQ7bY7sd6Li5sTkt1SlfsMfOcSZlYipgbMr7XjFWW2yh51R2SlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brsyr1zj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brsyr1zj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC91F000E9;
	Thu, 23 Jul 2026 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784809637;
	bh=29kO6oYeUoSm7e8Y1kHOj1bvp81JeeAODvGvsL9nYnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=brsyr1zjY38ayyaTX+WpF25csJg9sfdOpeQURKLG989VI0SqjFglM3g34526GJH3q
	 12XYkoyEwpYE8aK7SUFzuACj/6YWpoVoC3Hz9BcaEn7PKBdTThv/w3azsVNFdRFNwu
	 LLRPa8ScYjvb5MvBn6vkB9wHB+6gkbmtJ51OZ8HWVLvZ+oxVILxfQGxnjqnTkk/FGW
	 TvbQlpBE7A6ndn6xb+XVnax4OScuE3lvUvhZZsCgKNpl7U0ns+uRTZKFrC4le2hzKb
	 uZ2TgfH1ke6aV0mK/DuPlTbdBsIFtIeU76lz1F3DZHDKwb8AfUslrTA3KGSfRtfyWy
	 1c7zsPVJ8DXcQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, william.zhang@broadcom.com, 
 anand.gore@broadcom.com, kursad.oney@broadcom.com, 
 florian.fainelli@broadcom.com, rafal@milecki.pl, linux@weissschuh.net, 
 krzysztof.kozlowski@oss.qualcomm.com, tzungbi@kernel.org, 
 Ninad Naik <ninadnaik07@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, me@brighamcampbell.com
In-Reply-To: <20260713200732.2470666-1-ninadnaik07@gmail.com>
References: <20260713200732.2470666-1-ninadnaik07@gmail.com>
Subject: Re: (subset) [PATCH] leds: bcm63138: Use %pe to print pinctrl
 error instead of %ld
Message-Id: <178480963434.3405982.16645336608309304296.b4-ty@b4>
Date: Thu, 23 Jul 2026 13:27:14 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 14 Jul 2026 01:37:32 +0530, Ninad Naik wrote:
> Pass the pinctrl error pointer directly to %pe to print the
> symbolic error name.
> Detected by Coccinelle. Tested by compiling.

Applied, thanks!

[1/1] leds: bcm63138: Use %pe to print pinctrl error instead of %ld
      commit: b6e08e0ad4cfafab2c2070456e7eeba17608a35d

--
Lee Jones [李琼斯]

