Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4BF43B49D;
	Thu, 15 Oct 2026 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094062; cv=none; b=JwnSu2gUuSIicwqszCKyS8iyznG4+Esk6ipq08zssqK4XnQQ8jGqKyaZuRgFnKQqQjm64IcYqWJasW8wWVOULz1sMYh9w/tNUvIcHC13iz5Zj+J4RTvkOuUsBL2O74Vc79ndNFsNz0TR7gBj3tojsjrbPU3qsXx8cJMLWOpmmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094062; c=relaxed/simple;
	bh=cGIGrkpHW+Ke6Rv/NA94Xj8ya6lM4yQMYCBCbSkETvg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dvxRqh7zottRrPvFkhP4tgOMXq2sNR0ul8JlsQmr2cyMWK+LstYyZopa9Nb7J9IyrDcw8wBqwDLMDMLKCwzac1df+Tqz7d0larZd4n8s4HUVUxNINz2wBqvkLtAjnl9mI5uvCNjwYkws5s05+He1wBMNTTO+trKFDqysWewypw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCwmksz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCwmksz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9691E1F000C4;
	Thu, 15 Oct 2026 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094060;
	bh=cGIGrkpHW+Ke6Rv/NA94Xj8ya6lM4yQMYCBCbSkETvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hCwmksz0iNpcQBSj7v5V2Rfg6MhjQ/lLRqId6JUEKvJf7uBx0jIEjBPQsMbp2T2yZ
	 E/DEDJq0W8mYCxVTVHQ2jwSBi6V2ohSFxjdEOsGoOqCgBL7a5jKhp7uQvQ2vSWNUmy
	 OJf3/fCxsRD4oK+6ZibHi7+DGgMu8AIwN7zz9FekybpuMEsrZPzZgJsKgbMD6RQLMN
	 Ekt3LMPFZ05EwfR6A8bozU8jTnHteAL7q90MxHa4PQTRQ2JrwcWZzL1wxz+X9I27fE
	 vZqiccCzFKbafgatgdZ/0jbsWBmy3w2KaWYqsbDj+aHpuHvGMf3DOD40EpKZX1MzOW
	 MQTR5DockiAfg==
Message-ID: <sashiko-outbox-173371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:54:20 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit 196975238d12d86173118b995f0ffaed53199278
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible

This commit adds the qcom,pmk8850-pwm compatible string to the qcom-lpg
bindings, as the PMK8850 sleep-clock PMIC on Snapdragon X2 Elite exposes
the same LPG/PWM block as the PMK8550.

> dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible

[Severity: Low]
This isn't a bug, but the commit message description is not capitalized.
Should this start with "Add" instead of "add" to strictly follow the LED
subsystem capitalization conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015194732.6442=
8-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
