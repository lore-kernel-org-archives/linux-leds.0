Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806422745E;
	Mon,  9 Mar 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082164; cv=none; b=g5mJ5zHfu4OFRE0o5RzX81uwypyO8Q+wGHUrmK/c+Sm3E0QR/ssDkuYn3AIZp/8zGZEcxfAAdwntfkSsX536rEBBKSZ3Cp/FALCG1WUoCwz5Mgi03Wp5/j1oXIuFDjW+qQPbuqu4z6CGwnZKLdkyoQrRpgF6BzHQFiETVDB+EMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082164; c=relaxed/simple;
	bh=0c7PfNlywEu5YRiPhWq72Cwb/p1gFPYWyAfM/6HbHMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SQ9sIa1/kRNTEtsaU1ISjvjh2aZreodeQ395Xlo16wTXE+eow9aEkZu/Ee2xxBFgufV4s5Le48SNpGoPpMhZQ5WEx8Xb8mqQix5bIkJVrhufBBLy6zn3EaFthzrA7+JRUy2FXTt9/6XkLIoZvaeMA4QW7aln56CL3S4wba2tqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaJB5kdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaJB5kdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E393EC4CEF7;
	Mon,  9 Mar 2026 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082164;
	bh=0c7PfNlywEu5YRiPhWq72Cwb/p1gFPYWyAfM/6HbHMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QaJB5kdpK9REfw02zPJL5SzA6cp/g2GZpsqa2TqoPYncIbQKaOp5DfMSWS/RL+N+4
	 4DTu01L5qRpPTThvIEYX2JVaqNSGsutsnMcSw5ML4dyRX6JkuxE1wXnVaDEwyK1K6p
	 52GzZZe/jCgHWx/7CeWnvx9cj9Jw3NGboJHCZHQrYUL9usxtfTrgcaKTPEBRWmzBpt
	 A9TndQNrMMTBqPEY0GWMOznIxSUEHItvWBztbjBiyijajHq1O2oGb2ZyS1Dr25zOO+
	 jJJ5fvQDouHmzXbEDeZlpXjhKr3JW0vSjyAbmU1v+5jZosWHg/rNProaVmleSCYNtp
	 llfXkt5blg5Aw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 David Owens <daowens01@gmail.com>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305203706.841384-1-afd@ti.com>
References: <20260305203706.841384-1-afd@ti.com>
Subject: Re: [PATCH 1/5] leds: lp8860: Use a single regmap table
Message-Id: <177308216264.1638430.17176554849062156181.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 18:49:22 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 05 Mar 2026 14:37:02 -0600, Andrew Davis wrote:
> Instead of a regmap table each for the normal registers and the EEPROM
> registers, make one table and use an access table to prevent read/write
> to/from the registers between the two ranges. Slightly simplifies the
> code.
> 
> 

Applied, thanks!

[1/5] leds: lp8860: Use a single regmap table
      commit: cfbe3ef10db19c2a39640204be160952754e430c
[2/5] leds: lp8860: Return directly from lp8860_init
      commit: c6cde1446602bf990ce8ad81181434f436a16037
[3/5] leds: lp8860: Hold lock for all of EEPROM programming
      commit: 34b7e5d805a33263f4297b42922bae4c70c34026
[4/5] leds: lp8860: Remove unused read of STATUS register
      commit: e4bacd32bcf0fd0a3dc78363d5ce6aa3cce63563
[5/5] leds: lp8860: Do not always program EEPROM on probe
      commit: e5e4ccc8896f9391f718817a19603c08bf8d4cc4

--
Lee Jones [李琼斯]

