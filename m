Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509B4C81;
	Sat,  7 Mar 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898401; cv=none; b=CQt9yG0WntVL0n3zHPyImbhdoxlj+0h8nwRjV8oE0p0REwGoo5/SnJhZL+VU14noDPQNURpaAXJ3r+OTIJtzJxcNhT6H6PBOU60uU8+vigOsdD/qG8czkUwOafjVE+XqIELthIWrukYiCVIFLsfULePsQUNjvLEvq4J4TmXMoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898401; c=relaxed/simple;
	bh=WWFK9qRKQwUwwFElKRIF3QGX2s8VS5S9uO8BrgoboaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc0V0285Gg3BKjuIYdimD1tsPFX0nlbhDdXJeZW+KHQC+wWsW+OMz9IMT9yY6BLSQWCU7+BNvPhAsi79PQzTOs5qFXqgtZfgZSqryyyIRQnaiu7KMK2wBfLyIZHdxJMMhJJCJCPzfhV1Dj1eh/HV6aoetqp4SzqUV5scn0SWLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xog6bMaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xog6bMaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB00C19422;
	Sat,  7 Mar 2026 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772898400;
	bh=WWFK9qRKQwUwwFElKRIF3QGX2s8VS5S9uO8BrgoboaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xog6bMaKnp1CctLSLytYhEBJL9VadXzUaO58eka3e6M+3YaHo7VEO/2GHcV2ntkKo
	 eQIWGy+rk2PH1uvm0DJdpUdqHpNFupH2ZGFSQiZmLqtBHwtX8MWx2aavT/ybaOClBH
	 qpqT5eNjJKwDMi+jKc4k13CjX218zFx3JrGcq8GnKFzsWtlag05P9cdFdJ7NKEXxop
	 6B89QNiEpFTJqOaFMX2XnI/d+AlvSluiDCokaDN1PJ+X3I1hEJ/YpnEploKp3xEqNh
	 I2d5r4noePXL+dVvJ62OD73YfLwra1hp39qkTSvdpqZZCjCdayv6I6Ip8m7ALqWGA/
	 zO/kn/AYy+u3A==
Date: Sat, 7 Mar 2026 16:46:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
Message-ID: <20260307-fennec-of-nonstop-hurricane-de4f97@quoll>
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
 <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>

On Fri, Mar 06, 2026 at 04:58:02PM -0800, Rudraksha Gupta wrote:
> Some flash ICs use the same one-wire pulse-count protocol as the RT8515
> but have only a single GPIO line for both flash and torch modes, plus an
> optional unlock gate (e.g. a PMIC MPP) that must be driven high before
> the chip responds to the enable GPIO.
> 
> Make ent-gpios optional and add an unlock-gpios property to support
> these variants. Add a oneOf constraint requiring exactly one of
> ent-gpios or unlock-gpios. Add a binding example showing the
> single-GPIO configuration.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../devicetree/bindings/leds/richtek,rt8515.yaml   | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> index 0356371a6b01..820cf8c55090 100644
> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> @@ -15,6 +15,10 @@ description: |
>    current for each mode is defined in hardware using two resistors
>    RFS and RTS.
>  
> +  This driver also supports single-GPIO flash ICs that use the same

Drop reference to driver and explain the hardware here.

> +  one-wire pulse-count protocol on one line for both flash and torch.
> +  For these, only enf-gpios is required.
> +
>  properties:
>    compatible:
>      const: richtek,rt8515
> @@ -26,6 +30,14 @@ properties:
>    ent-gpios:
>      maxItems: 1
>      description: A connection to the 'ENT' (enable torch) pin.
> +      Optional for single-GPIO flash ICs where enf-gpios is used for
> +      both flash and torch modes.

So what happens with ENT GPIO on such boards? How is it connected?

Best regards,
Krzysztof

