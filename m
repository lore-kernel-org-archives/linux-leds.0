Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199508;
	b=Zwe5sDLyswGxWt+UBJBdNhtIFL/jA4rAzeB1TucatiSgah3pi+e91w3U5UwwCYIB7Ceh
	 ZhNnvRteza67jpkPsAIlDDgFuf0NI2vdyBDuo66kSVd+u+1AnGAjpiE99u847AMxO8A57
	 TEqHcBUguLriyHh8hxl9nugB1bKW0/RgPgIVYWlQa7Kb6ESGZRSfdAd5UgHLmcvV8PMw7
	 yOu9wPOdbBJ6KSSqGJMfg8xYEvdqcHZzO8vu0SehX3Fa0QMrE0aFQ8Ew44D09EX5Yc1Ez
	 mBEGG6G8FNBvH8iBlLwDzgvfv1ldG320FfvzcPl7nYkRWcD0uifth0xrxHIFKFvSkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199508;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=7qow57ht7mISLIlMRjimt2Eo/fJc5CpcIz1Vbvs6jWE=;
	b=poIZgASJIRU43NJCScwdp5YQ4zq+k4ntXLDztgHG+z7FRsihdWxr7LnZKhaCVZLUmIiD
	 NAAWM7sCUfkMCtvvvrQyYkKnj29wBrR2QjzeWfn6lgdOFUY8povnJsXNMsRx3TBj5A+co
	 2ZqJ12jXwb0jeVrkpf/qn5Ku79etkC0rE7JnJPU3/5kNWtt7BUrKX3oO547B4gkFPZyYc
	 91rpi+kQHlyl3qYCoLCyZer4A7E6Tr83i2ni1KiSUjqNpMTAwvZbU1WqcZVhlef60z9DA
	 VgWULaAY8JnBxyqhDnWDvFRY7zGwaiqv8kQBBbzLN/qvZ4seNhFEGkG6uU6he5J+GCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcRD2qbB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC2606A31F;
	Wed, 28 Oct 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcRD2qbB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395271F01829;
	Wed, 28 Oct 2026 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199508;
	bh=7qow57ht7mISLIlMRjimt2Eo/fJc5CpcIz1Vbvs6jWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FcRD2qbBJP5KMSKif0GlI97MN3m+C/ii9PhrYujlHkOijVsEKYoksHVNGCDcp5YFO
	 l5t2MxzwnU3fMUbTQH1Lmw0J4jr9EYHiqhefPWV8nbCCSFHKgkdee+LovgveePhq0l
	 RF2p9rsBH2ndTyqS0aACFIDhoxC+6NvvrTxG8nj7cs65JbCHi03XpcYpqy+DQ1TCcY
	 X+8eNCpoMIL1gpZB56lZwFkfHkZZjgzY7zLQUJxYaet0odDJjrAj9erIK2SjNue+0V
	 iqZPwjlpIUBVcZB0yvYLDge+vHTTqDLQChhXkwRuqGpqCGLKsfRKfJsVXx8Isv/CJh
	 lHlJjJzMvV7Fw==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261018225036.12000-1-rosenp@gmail.com>
References: <20261018225036.12000-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCH v3] leds: is31fl32xx: Fix NULL pointer
 dereference when binding via I2C ID table
Message-Id: <179319950697.3761109.15444646566740456953.b4-ty@b4>
Date: Wed, 28 Oct 2026 14:58:26 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 18 Oct 2026 15:50:36 -0700, Rosen Penev wrote:
> If the device binds via the I2C ID table (e.g. sysfs new_device, a
> software node, or a firmware node without a matching compatible),
> device_get_match_data() in is31fl32xx_probe() returns NULL, since only
> the OF match table carries the chip definition. is31fl32xx_parse_dt()
> then dereferences cdef->output_frequency_setting_reg and
> is31fl32xx_parse_child_dt() dereferences cdef->channels, causing a
> kernel oops.
> 
> [...]

Applied, thanks!

[1/1] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
      commit: add6cef9f655ba85155c1afc554c3856ab164660

--
Lee Jones [李琼斯]

