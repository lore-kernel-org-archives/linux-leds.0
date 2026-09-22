Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1285255C1CE
	for <linux-leds@vger.kernel.org>; Tue, 22 Sep 2026 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083680; cv=none; b=nQdcL13DNSHDkJ0q/CYdSMY985+pickHjZfhFID0VSd6+Mia4OUHAjGw9eRnYXSYYJRfnw0vRrcvtO0/jBDK1v212BMMlvAjZgV6oPK5zt3+w0esXDrGpK9ZIzE1eEFQLuPfPZ/1nNU6RCsL0tpKg3q7tz7YYbS23zb01GycsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083680; c=relaxed/simple;
	bh=abqRcD4yHLB6wUls+Xzj9VU2DZlA9k/BEzYoKuTLqXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HSijnqVAZOJo8HiWs7SXXDqlnev2/5UgcWD3nsXDQac2kcZYUvS9tVCmOBzvwj2YcRq7wdtYAPjTGa836UQeuk9RshubVGbUp5keKLrd96ZKJjCTAMgtjTEdCK20rbjV8hE8I/vygpvaeTI1h+NpG7VqSowkOyWm5PGDuQ5unF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB91+g2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB91+g2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9383D1F000FF;
	Tue, 22 Sep 2026 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083678;
	bh=EHCOqLQwOkhJI7wulnrSM9E+jr3VgT/47K2IS/n6O4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LB91+g2wMttinQwMttXm79D5tXwiIGJAqAPbm5DHfoKV/RTVqvBOfm0Ymhd62r1Ym
	 6s0ENUgdO3gR0/ZCCw+bpyakmp0t1aBiPgMcb9/8dBn4Fp6id9IYutIZEKr26Jb8X7
	 ttES9AcSOdGRSWW2cz0igbTSTPeuRk8h0xUKxA3JM4iB+nxKyVO/2b3lsBNnXAZ1Qc
	 Z6qqjJA6/77g35K58hUCKpqERSoqL99pbRq5oZpsBIX7pzd49Zmc7o+UtSf7Tp8vSb
	 1PXjHZKwNvX/QmvVf9SjCCQnu5uTG6FHxcFF3FyA71J7RaNZU+UcKv+A9fQD5/ll9L
	 VVBwWiSH1YvXw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dmitry Antipov <dmantipov@yandex.ru>
Cc: linux-leds@vger.kernel.org, sashiko-bot@kernel.org
In-Reply-To: <20260916161607.90106-1-dmantipov@yandex.ru>
References: <20260916161607.90106-1-dmantipov@yandex.ru>
Subject: Re: [PATCH v3 1/2] leds: flash: Prevent using uninitialized
 variable in flash_fault_show()
Message-Id: <179008367732.3394614.5392953024944922822.b4-ty@b4>
Date: Tue, 22 Sep 2026 14:27:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 16 Sep 2026 19:16:06 +0300, Dmitry Antipov wrote:
> In flash_fault_show(), address of uninitialized 'fault' variable is
> passed to device-specific .fault_get callbacks. This is not a problem
> if such a callback directly assigns the value like rt4505_fault_get(),
> but results in an undefined behavior if callback just performs bitwise
> ORs like as3645a_get_fault(). So just initialize 'fault' with zero.
> 
> 
> [...]

Applied, thanks!

[1/2] leds: flash: Prevent using uninitialized variable in flash_fault_show()
      commit: d229695f2162a41bfa614f175798fa56a5f1c969
[2/2] leds: flash: Simplify flash_fault_show()
      commit: b18158f705dcff53f76f37733dea5154f1b32444

--
Lee Jones [李琼斯]

