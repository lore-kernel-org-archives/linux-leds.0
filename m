Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB038F959;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035718; cv=none; b=CVXPztO0hILShoD2NouTv7IufUz7kEzx/UJeMViCA6MrW+nqxb5QcH+jukBzDPwF9JzgDtvKP+uBK3SoakNc+Hql080eCQ81YH2ycgHaXy2YJ3FONq04cBMGzdsIouOH8QWwsMLvPD9frlCoF1v4xU9xstN8BC5euPo76haYH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035718; c=relaxed/simple;
	bh=1R+1GPZ7oHsV11otnMezIlBcaLhpwQJU4kYs2FxjRqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nL+VerH1s2EHJj0BTpN+2jbAGYhgu0hhnLghPm+cCdQinSo7aW9Rj9OGT51h56He16B376HyLcCwnp9BuLK5iVKHrb8UXjIOxlcInh4G2+5Ir0tfH0Ydst/a4DFsaJAeQ+sdl3IK7s6qrWuH+Qto/z5NZzu1NM+YgN5Uf3V9E2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRUKSeHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRUKSeHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7D7C116D0;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=1R+1GPZ7oHsV11otnMezIlBcaLhpwQJU4kYs2FxjRqU=;
	h=From:To:Cc:Subject:Date:From;
	b=FRUKSeHL5v4Yi4cme4faAxkQraoNCEhFqiAL9NAwDPsqOsO9SWGs/vVJDdKFwtNrN
	 DaPbASyGdK9y9nZaZNWi6HzwjXhm5FucDD/+QUFKmCPzBCkYr61QkYrni78/qXijrZ
	 1uLeTJDEkouYuIeIR1diPfHY6NF4Jim6724Z1MXd1R2cZTlsZ99eceEhvoO/C4QV5t
	 tP29mXVCKWYJGdsBB2LmG0TCQLP1aqHRp6rp5XG3byrFAJLOtMQXhFPzgNlCPOZG59
	 HmvH18ZDgN6yOuzGLhVBYYSJKeoBVpMNPRUxnWOwE/QIvdLsYKLfc7J4tuG1uRP/do
	 x5J1JPa1lacRA==
Received: by wens.tw (Postfix, from userid 1000)
	id 963C75FEC5; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Thu, 26 Feb 2026 00:08:23 +0800
Message-ID: <20260225160828.1687643-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series enables the RGB LEDs found on the Avaota A1 board. The LEDs
are connected in series to the SoC's LED controller.

Patch 1 adds a new compatible string for the LED controller found in the
Allwinner A523 SoC family.

Patch 2 adds a device node for the LED controller to the dtsi file.

Patch 3 enables the LEDs found on the Avaota A1 board.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
  arm64: dts: allwinner: sun55i-a523: Add LED controller
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs

 .../leds/allwinner,sun50i-a100-ledc.yaml      |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 ++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.47.3

