Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6082B3382C7;
	Sat, 17 Oct 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256105; cv=none; b=AFGDH/WXcn0x0fA34NCUR5dsw/tSFu/GFSXJnM/r6clccyPx0pd5tBoKpy7D+pDtiLqHSspTLt8Xtvi8i9iQhFcrGxP530zZZJUOwqaPT2nF9L8UdrcPY1yxPCefVOxYTugMak9D2RBTn8nXOQ49Bb1hDPBg8kAJLsUz93pExgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256105; c=relaxed/simple;
	bh=boFUY8GM2vG4V5Znvl9GaK5I4Xye1xg0fDGSdjmdNYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgP3IHP1aCjzfBCOKRHoFPXCv/GyOSn/HU1wS+QRiwKrzccsq7JSSWlOx4UYbJbTGeiOdHai7/WgAVWTFARR0JfD30m3sXJlHu+SIv+ZCahwZf6KbVFMSEvf1bEm5r3BrQ5gmSbBW9Jb2Nmgpqb1pvphiOfEmoYnf54PozWDGPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+wUTeNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+wUTeNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4DA1F000C4;
	Sat, 17 Oct 2026 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256104;
	bh=PaoT9sofNGtgZuRKtI2fB8bLyj4fOUNf5Rf4Lkh7hy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+wUTeNo+gj8a3j7yZyuUbPKLWe7fMvjU7T+zD4HrSL0mffZDSRsu3Xm3zsSZhvWp
	 DGDYJ8cbakngwml8FXrzfeYtgoWDYPFwkv9zrDaddnCa6/CJc4GrXZOvNNYGYOoEuN
	 13aWlYH9ATM8WjSDpfI0GWSxQiUjwbdokSFsULHm3LYXhQFRXrkxRM0oW1Yo4CU4vz
	 34LL7iPpZ1jh3wDpmuJKjO4sYI+w2CAZ0WuafzM6yFaCwftSXGaw+kGShG3fFk4KNe
	 4Z3LGa9ZgpEfo4Qwf17FOGrX9NdwKo5dg5ac0c16HWWvU4e9wfZtlieQnee3qR24KP
	 KJ6MK/2cZ0N4w==
Date: Sat, 17 Oct 2026 18:55:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm
 compatible
Message-ID: <20261017-tremendous-flashy-jackal-705db7@quoll>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 08:47:28PM +0100, Srinivas Kandagatla wrote:
> The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
> the same two-channel LPG/PWM block as PMK8550 and reuses the same
> programming model.
> 
> Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
> (EDP_BL/PWMR_BV_PS).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

