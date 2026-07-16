Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7593F823E;
	Thu, 16 Jul 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197417; cv=none; b=LsY7oFEWrYWQYxq2PzTadQ+2C8si8IQ29fNRqY+iD/SJ7LA7l2WuA5Iqt0TjIC3eDVDZsDyd4Eq0QPLPpoO2/Cpko8tXGWSq4DrWTTynilGE43PpMQduaURVrb+DSMkDageVwTdwclAllrxZuWRG0VE01/8MfFYSNjrtpq/ILgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197417; c=relaxed/simple;
	bh=/byrmC8abQOB2dkl0qNxH3Kx202Odx0wAT44/KVSZI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R7g+G9Y8tVY7BJl7oJ03+W0i/ybK6QZw0kGsz1urhR+VMe0Ss8vS+USocMj3lUQ02X7wkPlTeplXA9PsS1JFq4wVGRe2LKu/3z1kBJlzNR6bVqrY9SXEmwfLS8VSZJ6dVCFmqjncMJfHA5Tkzqn70mNrAFbDvHmmn/5B1422oys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/c+G04U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/c+G04U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740BD1F00A3A;
	Thu, 16 Jul 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784197416;
	bh=1bFxSJUtoDhVL62DJfCXe3Dinu50IPeIL+flIXU/z8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V/c+G04UfE8KzxJVV1UfaE6JXSz+1NcakKL78kfzp4LSpN1bNflN+gYYoxeSSOjpW
	 C8eSLE1J0VX6Bxd1QLuEiTmHtvg9fHO/rauAJxACoPFgVuMwJ0UpKpQkValBB9nZAI
	 wauOc3xIAXCn6u/hLBZHbMdLf0LfOMBnFF2g84eEo0XuFVaYknWcai/8ETNZSHSB5U
	 vIy2COx4S4pL1weDWSe1ktAFTvoC8BvnL3bM5tn6yRTH51ARxtGJcE653pHWOA2M8q
	 Q7GkHs7qGo+51cZBOKkn+pRFBvJ97zCtWYnN1CfZyX6gxKdq9HGehnsDFX1EWAzYE5
	 NphU9LtJwzqzw==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References: <20260711192842.845048-2-samuel@sholland.org>
Subject: Re: (subset) [PATCH 1/4] dt-bindings: leds: Document "gpio"
 trigger
Message-Id: <178419741320.1254511.5387639969436982664.b4-ty@b4>
Date: Thu, 16 Jul 2026 11:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 11 Jul 2026 14:28:25 -0500, Samuel Holland wrote:
> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
> 
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: leds: Document "gpio" trigger
      commit: 4d8da7e3dc0d4512e5e6f29df3ca136d7a90d464

--
Lee Jones [李琼斯]

