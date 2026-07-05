Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112C3A6EEC;
	Sun,  5 Jul 2026 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285093; cv=none; b=dqwoMGxL5FFYQ1rjaRMTUqju6TcxOW9mwhgTABBd1i+E25qu4+9xAQnT5SgJUHGfTKC0KqDMdn83nJdVZKVosKh2VvKtyqV5FVfIvejB/UQOYVRWJRHCYrwnesvVkH/mwsA4ld4t975wwyHvlhJ4eD/c1q9KR0Ivhb08L2mADJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285093; c=relaxed/simple;
	bh=fPLjtqTdfUwvKv45UkaXvC5ZiYor7iKNrdtWIDVWnaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFl0GjLQZ5tUFQinBjV6/6u/GR/r7gxyp6uS9Uq8jNnOmR78JMe/B2ahTsRZg2CZNDaT8lNptrJLGO6NT1H8aqYULLHUm20U5ybz6cTPsvU290TcuVAwhvny0rvf6oxieA3QywNLUMGdVjw7E0e8RVSj55kjZ94pgALNpzwGG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRi1Owkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRi1Owkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968E81F00A3A;
	Sun,  5 Jul 2026 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285091;
	bh=bt3Qq+H8uaYIqm5V40DzeXFpBOHpi7xmdNGZHdJuHUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LRi1Owkn0mw/4PFM1S+RyPv8Wm+vBTfqw3RKki6DMEMhcdMNeh8bb6cabdQRlmPw9
	 R12FDSJvUOKg+LmrVGs/5cx3CnGMdKWGUqdLvgIytkNR80GdmhcPl01JG7AwUHtmPj
	 0fqRmaip9/2R2iR5g4gwG+o/IXovdZPV8p8nWRAJojFksOT8QaCEEkBnWJSkf03Q+j
	 zftgYbiOOdYfoy77CQPnD24qx+wk+YPWaY+8xR+aMixgT0B/gzKdhcbIoEI2Kxbu0t
	 VNdOkbNcLFFqtII0RW7fhgp1wVxfE7EsyKoWMZOO4MX1cTnQvFj/KgQSTonYv1UOC2
	 ZTa3FzfXFwR2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Messier <alex@me.ssier.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Describe more hardware of the HTC One (M8)
Date: Sun,  5 Jul 2026 15:57:50 -0500
Message-ID: <178328508264.1157743.6203884354809743670.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Apr 2026 01:16:56 -0400, Alexandre Messier wrote:
> Add hardware description for these parts of the HTC One (M8):
> 
>  - Notification LEDs
>  - Bluetooth
>  - NFC
>  - Touchscreen
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      commit: c11865aa07e8a1b1b3c50b995f7175312a4045a8
[2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      commit: 858e8a50ba0c0c9caa45f25dfbbb8b6bb26154b0
[3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      commit: 132a69d4092737d35470adc0f9c89fc68caf6288
[4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
      commit: 811a24b0ec0c3ec74dbe324c390b75a2b92571ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
