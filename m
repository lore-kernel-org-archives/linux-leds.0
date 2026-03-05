Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72D3803E9;
	Thu,  5 Mar 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731904; cv=none; b=LnFEQ3M+3rXoWZbbGvbH4yhtkHEBKNExbYvjuxxKggr/p0n9gJjv8h5Fh1qee1D/hv0xQHu6r8SDuVFqQZ6Rx+v7R+DnIA5Hwe3Sr+mzWrcQkYjVBQiWyTPiYnZ7dlUx4v/MiGvJ242nph8H0rrZe3UYaSQVFJlwZuy0X1ZOeDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731904; c=relaxed/simple;
	bh=Qie5osW0uZ2sQL4OaaO+w1LxzvHpSS8rilA5iVzLsT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dUcwHcRR99QL3cgBYJ4G5uKlBK7muuhKAfkWuJ1GyvnocAJUY/L73WfCg/+TEmd88e/vsPCArgANSAZzCwTd2ozj39LjKrJF6Pk2tm4yulerEsffi3S0cpgdeoe4wueXDxaZj9f50dEPqMJUDacTWOGjjSYtqA8Q1VqmRZt2cRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRACvwRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRACvwRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FDBC116C6;
	Thu,  5 Mar 2026 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772731903;
	bh=Qie5osW0uZ2sQL4OaaO+w1LxzvHpSS8rilA5iVzLsT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kRACvwRB+BfjZpPt/KTlPxQGQUFMGFlx1kl8trRdDuwYZqFZ8ir4bOG74v5bC8ke9
	 wr1f5IA4h1nUj1USraRNN//Oeg3r+d4aa7APMjj47NiKgWvjDHy+7HMARxh0HfwVtv
	 h+2WEsI1jKVbMMupQy5uQRVNWIkRL9fDtDxh8HBvyn30NldC5bLCbUumrGnkQH8HWY
	 i4y1FJugZ5J+v64IkCXM1UEnwAIUmX32Zqdw9+LE4xIBEq3cDSjvqwkIy0vEBPrjCK
	 e8OQJlWaW0WvYtvSck/zjrPPBua2Z+fd1TpQWWjsHD7KgNfJMVFiD/qLOJvdfgTsaq
	 gpGPgbao2jMkw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Neel Bullywon <neelb2403@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260207181825.13481-1-neelb2403@gmail.com>
References: <20260207181825.13481-1-neelb2403@gmail.com>
Subject: Re: (subset) [PATCH v1] leds: lp5569: Use sysfs_emit instead of
 sprintf()
Message-Id: <177273190239.340952.15045169891533731436.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 17:31:42 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Sat, 07 Feb 2026 13:18:25 -0500, Neel Bullywon wrote:
> Replace sprintf() with sysfs_emit(), which is the modern standard for
> formatting sysfs output.
> 
> This change aligng with the kernel's best practices and ensures usage of
> the most up to date API.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp5569: Use sysfs_emit instead of sprintf()
      commit: 1db4b1d941f7453ba2922e32c0f2bd1216cb3ae6

--
Lee Jones [李琼斯]

