Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198F3F0A9F;
	Tue, 29 Sep 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651782; cv=none; b=DKVh552qI+PeBYReglV1XiJJyIqjhleOwOBNhm+4zo6LRmrWesi9+hK4C9NFBd3K+i7xbh3dVp9CbOAlbpqfyO3/pmoW6pnjPubGxxyKn+uuiMYTUcAAkv7/wAQIu7gCVZ40F3CuzrQrk73kyt35ivmdksjoz6kI46T4H6o1nfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651782; c=relaxed/simple;
	bh=zKQyfn6pDstUi6DjFk+m0sUyeW7Z6MVCryTPAgik9/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQiJv9M4AJBULP1aL9q+2+XrZ6IdqtnKEXP44UuAjrtFnXwt6jTNyofwynp++cXyiSG3lZXVV8f5pax2K9hxFqDN5Wv56Ct34m7UKEhooGPba0P33uLNnp4TxKWuOxOtAO2vyaEobZ0x2wwU+Eg6MdavFi9UkvkQdGICUSMMl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct5CP3gY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct5CP3gY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21421F0089A;
	Tue, 29 Sep 2026 03:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651771;
	bh=2VALSZgCDjmO8Q7GBtFbcfhXQx00jZs/sC/SmEZ+zoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ct5CP3gYaXqcg9hm831btOui4p+J81TGq6dp5DiI9L7O7+67s9RwpKlWo5Gz/hEyJ
	 dgvra64WUTsA8OUdx7JyNu6kzBvwW/yihJDCc04FVQQBLx+oiUQVO9PQOe3Lgj/1Sc
	 IghtoC6+ssRwZRvrVmyIun0UJYeSOklNGX+0WWg3UK8laowtZ1aOv+9F7awMbnU/OC
	 ghCstVQe4MQjIr07vkuy07Gn0cOC28NZ1KnyZ6GQOaG59pBkI/AOudOr6mC6zs/ZbU
	 atBHO50gHnO7d6X12EHWw52WVpRcoycl6TnYIoj5VPupUTr4Gk03/XLZpXud9G2iOj
	 S45Ji0OUBAsHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/4] leds: pca963x: Add multicolor support and enable Monza RGB LEDs
Date: Mon, 28 Sep 2026 22:15:04 -0500
Message-ID: <179065170891.2673486.3657413567837706930.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 16:54:32 +0200, Loic Poulain wrote:
> Some devices use PCA963x controllers to drive RGB LEDs, where
> multiple PWM channels correspond to a single logical LED. Add
> support for grouping such channels into a multicolor LED device,
> using the LED multicolor class framework.
> 
> The DT bindings are extended to describe these groupings via a
> multi-led@N node with sub-nodes representing individual color
> channels. This follows conventions used by other multicolor LED
> drivers, while maintaining full backward compatibility with
> existing single-color LED definitions.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: monaco-arduino-monza: microcontroller LEDs
      commit: f765b95e39380ec1ef8213aaece1cf3a0d975bed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
