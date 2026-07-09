Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BC40245A;
	Thu,  9 Jul 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590805; cv=none; b=OlnieaHuteZy+DA0D0jwynRTuOxFjY2nOFVgDJPZxbnPEFrMYPsyPQcSBH8xbSqHO9DyBXPf53mYhnRrP0Z3gI04qq4yAsHdMtEfJV5EMSiv3nCUS9l1o5RJl+mqQ38wA8eA/gzH82oQU5KH9fK/v2cn7InwbzrqhscBiW1YGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590805; c=relaxed/simple;
	bh=FPi+s9qb/jVh+ZKFceYEakNNOQ0CwHRz4IY8USk5hIw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hp4sNSISTdjQN7937E8lzqhGtqzmsuckFzRZU+939XUZDgknV2zzwukExuZqKAm4O8O4A5FdHE4VLJVXqL5qbWO3Bburp8IKAw9ykldamQt/a0qxqfGoQT9yjn6HRVssOQS9qzewCyy6jkloQmq77iwjz+JyKuAVdq+oHu0h5rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feZcDoOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feZcDoOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEEF1F000E9;
	Thu,  9 Jul 2026 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783590804;
	bh=zi1SyOfZKe5IXjofH6iQsiZ299oSS1o8JdlC02TFc0s=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=feZcDoOPvLu36ZoS2lBc0Un7vDaTPveTynVwOR28s7Tt3TFphSZcg2FxEv1/1ITkY
	 rWFJVofPNIeWwRPGLNJgW5eGS8BpCb7YFvpYUk1bFt2be1EV8AMMes+2mtn2Phcljk
	 ciA2MWtRecWvBbn2oj5M8u1teFx9zjn2ZL7R3h11Rr3eeVZENhdlRLY3u7LVf9ATN/
	 Wjjugn6W4z9gMz38Sqjr94a/UfQCiKNXQ1wpL15hw975mnej61KpB3Mcx/Oucir6+u
	 mMqtpw78RFL0Wn9DyQnKDeV2ZmvaBYqe+9L6DSywarPvf90EBkhZMY2qhY2ywjd/73
	 hCeOra56lDN7g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manuel Fombuena <fombuena@outlook.com>
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v7 0/9] leds: st1202: fix multiple bugs in pattern
 engine and brightness handling
Message-Id: <178359080300.2074236.10082425087568524695.b4-ty@b4>
Date: Thu, 09 Jul 2026 10:53:23 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 02 Jul 2026 23:23:37 +0100, Manuel Fombuena wrote:
> This series fixes several bugs in the LED1202 driver related to hardware
> pattern programming and brightness control. The issues were found during
> testing on a Linksys MX4200v2 router running OpenWrt.
> 
> --- Pattern sequence not stopped before reprogramming ---
> 
> The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
> pattern duration registers are only applied after the sequence completes
> or is stopped. When running in infinite loop mode the sequence never
> completes on its own, so these writes are silently ignored by the
> hardware.
> 
> [...]

Applied, thanks!

[1/9] leds: st1202: stop pattern sequence before reprogramming
      commit: 9c019a8cb95d820e0bd03e75cfbad2c5b13941b7
[2/9] leds: st1202: validate pattern input before stopping the sequence
      commit: fd2529ba8fb44cd4b56f1069363b949644b42cec
[3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
      commit: d32f8bdc2b417a3013e1316a54a0b314f973bbc1
[4/9] leds: st1202: set all pattern PWM slots to full after clearing pattern
      commit: d2ca0e2b6d6430f9c60bb2e0ee0b2b3dc4e5d86a
[5/9] leds: st1202: fix spurious pattern sequence start in setup
      commit: dcc31246aaf0d330a3ba9a725f56c33e6d634caa
[6/9] leds: st1202: fix brightness having no effect while pattern mode is active
      commit: 7cbe470366bdd43c7e8114fb2c4d74fa69093121
[7/9] leds: st1202: disable channel when brightness is set to zero
      commit: 0767335233a8cbab00bbe260a4e4bd380c7677fd
[8/9] leds: st1202: validate LED reg property against channel count
      commit: cf197514bdfd3877f42b5dce1efd40b7b686547e
[9/9] leds: st1202: correct and extend hw_pattern documentation
      commit: 96fa4d69958cf90740d756d1e45cdb02cface41b

--
Lee Jones [李琼斯]

