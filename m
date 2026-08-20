Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B5478846;
	Thu, 20 Aug 2026 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245384; cv=none; b=F0kYgwZYlNPzaZNcpX2ynYmEe6JN3a8g7h0ERChHlVhvUEw7QumVW+/fV1vcTui0wXShkjVttS5WM/kQmrbPEdXb3SJLnLmOaId/BjjTNFfW2FPg4jJRh689q4CHdppjSh8alHLouLleFS//YNNZp9/YslkicmWR9eCRDOxsSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245384; c=relaxed/simple;
	bh=dBntv5rINKeRHeEMjGgLuGQBnSJBGgN4taF/Z+XayZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpHRiSNipUzzCTMnZTvmWIIr29MRXxIV+H1V6F/u5+xYixLQp1+8RXOyg2D6ETlEOV4oZ4kCl5sD3ijNs8gv17SN0WkQntgttPKZmCNrAlKLAZJTex4gg0Bz+fZtsJ6okvo36Vs27Vo46TGbBM1yadkfcRxVn0UEXG3moBE7cN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDdcEEzf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDdcEEzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155621F000E9;
	Thu, 20 Aug 2026 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787245383;
	bh=dBntv5rINKeRHeEMjGgLuGQBnSJBGgN4taF/Z+XayZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mDdcEEzf23oTKwdEFitcmdJbuWIGfkTu8BE9xrTL06ntzLvEMSElHBLFY/QXFPxWK
	 mDwAE4nO6G0dimF6bXkniH8hqvk/PFNPfcWxHJwqzoM6LSYWv+Yfce1D6IVonwWXWk
	 E1249wHyobCGwgiKIKMlhXy3phVmMmtWz/P953HICjcUVDsLuzeKoDgNgz4nT/UELc
	 JsWCtCR/zU9tvv5vyFjacW7l3ueA6M5DYBYhkkw5rU3kE1skg4k59qjL2vx2X1q5uv
	 kIEMELo4SaqSzrT6D0CCjOPRiXHHq+MZA0T4Gke7bSz18RXQsD6XOOtknOYIUhiWEG
	 XbgNg5/kcplGg==
Date: Thu, 20 Aug 2026 10:03:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Nam Tran
 <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C
 peripheral support
Message-ID: <20260820100302.1609c979@kernel.org>
In-Reply-To: <CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
	<20260818095654.5357db1d@kernel.org>
	<CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 11:12:35 -0700 Ahmad Byagowi wrote:
> I should have stated this existing hardware and end-user use case
> explicitly in the cover letter. I will add it to the next revision.

You need to send the leds and i2c patches to relevant trees first.
We won't take them via net-next.
