Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C3542EF9;
	Tue, 22 Sep 2026 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080256; cv=none; b=U1x+oECmOR/vSndsKKpp2MmGSW6uoIYNr1MTKfuuDalNiR3O0ykcbkldVrAAWvU19wsfxI1N/nupD35/C3rK1KOn/fDRS4rmyi4yMRnIXW+5XNvnY1rQWbK+WtG9+snlmIStlsZyavtfSk1krklsDxG5eun0mxOYQPhf7Lq9fkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080256; c=relaxed/simple;
	bh=jZylOUC6YyIvbflbhe/jfdi0MUU6cYupxxg8b1kDvMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZqChxhNpSSdu0M1d7t732qElIaawwoUDIBfGMg4oN+/c4qgYD33yjsiROe7i1zAw5BCHjadcWnNjw+2faHLWejGWTgzI/3aqOi4WPIW1m5otCx9aVs/zaihc8GH++RUUzZt9VhJvLUi2nuy1LbpFUE2Gk6yiTLR4p88S5+WHSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnif+hDo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnif+hDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F131F00893;
	Tue, 22 Sep 2026 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080255;
	bh=1WoBmhdZdxyDyI/QKK1tcl2sM5zxbK5OVqHb13+WhG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fnif+hDokS6+RKBAg3nd10+nt74J54EZEhDE1HhUeKPTf+ymA/eE5R3l7EkgviEJW
	 IRKiuYtOXOB2bwKesoUyC7lg3jgtzOJ3rLzUxMpbfGZ0Na6Q8p/JXQCOwb+UOvGEDK
	 A0fm7t+M9fXpFDGC9vnRJ0UFMw/BppJfMDwdB+jIwUyORaY2E/2KuKnIljIsywym/Z
	 uIEjnL23BJyvdXertN4Lncw3LuQXknFAnr9BwC7T1qbtUHriIYOpvEKaBjL8hUihjP
	 FUt7WA331hBOzvOz7OThayeFXjhjkGZk2NMlDIJzumCqvuFZuVSIu2GrLeandorJVO
	 sFPbhe7YbJyiQ==
From: Lee Jones <lee@kernel.org>
To: Riku Voipio <riku.voipio@iki.fi>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, haibo.chen@oss.nxp.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Haibo Chen <haibo.chen@nxp.com>
In-Reply-To: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
References: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
Subject: Re: (subset) [PATCH] leds: pca9532: check
 i2c_smbus_read_byte_data() return value
Message-Id: <179008025334.3359204.10005099701464589385.b4-ty@b4>
Date: Tue, 22 Sep 2026 13:30:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 27 Jul 2026 17:57:54 +0800, haibo.chen@oss.nxp.com wrote:
> Coverity report INTEGER_OVERFLOW (tainted_data_return ->
> cast_underflow -> overflow) in pca9532_getled().
> pca9532_getled() stored the return value of i2c_smbus_read_byte_data()
> into a char and used it directly to compute the LED state without
> checking for an error. i2c_smbus_read_byte_data() returns a negative
> error code on failure. On an I2C read error the negative value was
> assigned to an unsigned type, triggering an integer underflow/overflow,
> and a meaningless LED state was returned to the caller.
> 
> [...]

Applied, thanks!

[1/1] leds: pca9532: check i2c_smbus_read_byte_data() return value
      commit: 1b75f038e5f71ed32ce6593b5763f9776ec58a25

--
Lee Jones [李琼斯]

