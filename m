Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508D3E8C41;
	Wed,  4 Feb 2026 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203152; cv=none; b=b6ukN5VE0MEOICvJLxe6sQcmrhiOo/CUhRGTfLS0QPVdrl0gAvoUTAlvV2wDWmINSU6Tn96LiMrBB4jz/2cg08VL6i6Wzg1PQL01VMQqNrpmlvuZqokqRUSFF8MSo8zOFAp2NKDRUinDbeKiBrNk7Yj5Kgq5XH1GsqFrcBjPEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203152; c=relaxed/simple;
	bh=PkJXOl4pp02hirI3pGXy7PZHHpLf4/Xhx/t+MrNESb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tmheYzHn0CfUx5KyRtqWoS6x16JDYHPLKxtMfdYx9nmEFFeP9JsQG7NKYcrfrpTpjviYuFt7BSUFAzS0mE6YjH0Tr1rj5atkWRBZutId/ptoeh31UQSss+Ga+99kuNqXBhvYTuw89ocb/sbNJ0duMprSO5Vxqy5fygtvLIRK/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO3GjapM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO3GjapM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29349C16AAE;
	Wed,  4 Feb 2026 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203152;
	bh=PkJXOl4pp02hirI3pGXy7PZHHpLf4/Xhx/t+MrNESb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nO3GjapMR4doY0/K5HOC5jv8A/x/cZyuu7jd6PY2YHlpRlahyp42uKsVxoHLtC7p6
	 EHMzcyCKMGE5wLFzkffwZu3K0v3pKk+Hi27S1qQD8R6tjbZ8accr3gQmQOP4A2R1Pe
	 pHsAS8UxgUUeGbouGRxlmNFBbDxvWJhJE50QwBjYuUcXx0IOmUJgW5mGEP8WwRUhRK
	 G/z8rAveMf4anQrUHb3w9DXnO1qzkm/Ujlhfd3HTw1c27H175U+Rbt0/l+fnBD9VB+
	 oiGEnCcsSvvlr4VamA4lSydTSqoigQRcuB+2Qtjx96bJO7rK6q/zW8r/PEGpUAb4LG
	 +mebSCOhvNl1g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121235746.370607-1-robh@kernel.org>
References: <20260121235746.370607-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: leds: Convert ti,lm3697 to DT
 schema
Message-Id: <177020314988.1159995.7748487141446466712.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:05:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 21 Jan 2026 17:57:45 -0600, Rob Herring (Arm) wrote:
> Convert the TI LM3697 LED driver binding to DT schema format. It's a
> straight-forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: Convert ti,lm3697 to DT schema
      commit: b2c87f5e98cd88095dbc6802197526703d5e4e48

--
Lee Jones [李琼斯]

