Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31463E5570;
	Wed, 17 Jun 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707681; cv=none; b=AiAcLAvV0Qgx4a1Vj1cD1NgFJfBYdi3yKOB5O2mtzTCVZepDUPLAuMtuV8oA/7NE0YMLfY27y9HXa8oAgU/Mhap0g2LWMYLOP4861mD6zwahsqFNvbe0hjuM/OOQlVOjhdJ3+pf+ZkU8rCCCQQ9+SuLvBVzVHJqQD3+YU5zcze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707681; c=relaxed/simple;
	bh=gbcwfIqQk/SiNy9mAf17Fap730sdHglnahEjyBgjgbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=isnx3MdLnBHJfGkzfD3rAvIQ+N3IZU+ZBUEkOMfRqrgGqJ0sikuWBiwHyi4BmbZmbygaV/F4oVPUin6/NQJaNom8kMxKY8GXOIVurcwBPywu6E7nLtv5DSKYPxY1xUJnamORw9hB/lM06xI+kXcm1drE41YlxlqkZL5vonNAwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeUXPv/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeUXPv/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BE51F00A3A;
	Wed, 17 Jun 2026 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781707679;
	bh=eZGB9EDPJPmx499AeGY1lMTU/ir06dPRWzp+DbysV3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VeUXPv/cbM99dmwl/oLl4HegllRbhasfo/lUJmLiczml+sWJtHKneBqlnkytBZNJ7
	 7OX3Vgni+JwHpcpkwrkkZi9EZErk9uYYIKRF1YMZzvJRg7jd+TJ7f1M2yGS9ZyLK3g
	 uCAkFfIerlNIGC7D+FQdt0LVO3ndrTzrkEQ75b2d+oEgJu7+Sd07SFdX+vC187ivwM
	 JwRGy4Oi6HNRzn9GQ+F09ZCF9Na55/XZ7kcXS0KwWHh0KGXpgH+LICAs2X1LQuHU8O
	 FoaudrESv9qL/oivV1eWbm899j8WD+Sh4aCBLcwqSZNx3KflPhQwmXdklNvredoKEh
	 BqFP6Vdndyung==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20260605-multicolor-default-v2-2-ed07271df6b0@pengutronix.de>
References: <20260605-multicolor-default-v2-2-ed07271df6b0@pengutronix.de>
Subject: Re: (subset) [PATCH v2 2/2] leds: pwm-multicolor: Introduce
 default-intensity property
Message-Id: <178170767624.1623415.15294454040580448912.b4-ty@b4>
Date: Wed, 17 Jun 2026 15:47:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 05 Jun 2026 09:27:48 +0200, Jonas Rebmann wrote:
> Like all LED drivers, pwm-multicolor supports turning on an LED on boot
> by setting linux,default-trigger, e.g. to "default-on". pwm-multicolor
> however scales the brightness of the color-component sub-LEDs with their
> individual intensity value. Since these intensities are
> zero-initialized, on boot a trigger is invisible until colors are set
> from userspace.
> 
> [...]

Applied, thanks!

[2/2] leds: pwm-multicolor: Introduce default-intensity property
      commit: 69dd3b9d8681085eceeb35459a12d67b848372d4

--
Lee Jones [李琼斯]

