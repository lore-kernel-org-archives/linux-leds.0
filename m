Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA43A1686;
	Fri, 16 Oct 2026 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194694; cv=none; b=rB/gw9Ll+kJMploG8m0kc2k7iKkVNCyozzDx9Tf2weQ2lKnb1zuhZGGpla4+cp+Ik/fI4SjCQwrRLXofdEQgCOjPmq7cbrxC/Kjzj8jjMjMD9MVswB3EDVAF7RUhtCUvopZYoKbQ2knUaxmPQqVf68hcyg3hW+xKNlLhXKvC2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194694; c=relaxed/simple;
	bh=9WWk+LP5LBhJDFYZzJAoJlEnhuXw7gpFhUlDqrc/uic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KY2D0634HDlg9G/6xfiA4i9AI7Q8afBQK3gwAjOtNr287zZ2xutNjLG2vT5ow58C+zGmw4IT0Bma78IrVtFNyg1j9KvwRV5A7XQkAtShbWZgjWxuavP7O3xk8ttzzVc05gToYJce+LLDD2YuP5PrGjOoMPLAAaT0PAqOyi+M+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org; spf=pass smtp.mailfrom=phorex.org; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j61tK0n5Fz2ScWl
From: Luke Macken <luke@phorex.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Macken <luke@phorex.org>
Subject: Re: [PATCH 0/4] Mahua T14s Gen 7 eDP backlight via PMK8850 LPG
Date: Fri, 16 Oct 2026 17:51:17 -0600
Message-ID: <20261016235117.4060834-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Lenovo ThinkPad T14s Gen 7 (22A7000VUS, BOE NE140WUM-N41 panel)
with linux-next next-20261015 plus this series: the backlight device
/sys/class/backlight/backlight is registered with max_brightness 4095 and
the brightness keys work.

Tested-by: Luke Macken <luke@phorex.org>

Two observations: the panel's DPCD advertises PWM-pin brightness control
only (0x701 = 0x83, 0x702 = 0x95, no AUX_SET_CAP), and the firmware leaves
the PMK8850 PWM channel at 0xe800 enabled with GPIO5 in func3, so the LPG
path matches what the hardware is set up for.
