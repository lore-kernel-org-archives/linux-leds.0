Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916099;
	b=FUZ3/cVbwA3W/+VAPg/yylGOX/4wp4RTqy7AwB7m9WctNkxsHbV7r+X0z3AIJMXeyS6m
	 4eT71kY0jQwy5XXXPUhvmPQouDf3yxthTYkOnQK7m5MGFdEJzqz1O5Yo4ZWAsGuWutWhN
	 VR3HZ080ibTjBvCmCUaO5xO+bPwX0odSMVoUnODFXBrIxlGOM1lp8alQhALoFgFRPqnGI
	 f/K4X2mS9JkCjryCHFO3gK87zsYKphWp4Xz8IGR2pVBk9rMrMgX0mNqs98AbqYO5fQkvn
	 V3djGYwDFg5sCkpuEfGEVMxJVbLlPBLRic2H3mI8UVf1Q3+fqb9xF8QXN2fqv/P5ssQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916099;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=hafnD3hdUTBG+I//74sAT7NVLzBxbLqlDm9QdAgelSE=;
	b=pjC09BUNDmdp4FBLskebNFaEZtQokgCljOOkhXm5rkEypOnVjI9e7/e2TatD4k54j6Qb
	 Vv/HqY2ZGG73f9mQ9+EbHAiPeKzNzh4YqCJp/8hfQOD4x0wufPQQvEFcnBC5euM3K3bLE
	 sPxxsTOIvwtP57XtAgUexKxUztaNM5ycpgvE1fpjbDd4Qv0pZjInZjkts6Xgx4ENFvEw5
	 p9tie85Ito4qEC+x4wRnGvp/YCRkSsLNLKuIZ6INewsOt+Jtz1aR8iXXHYuiVVZKquNpJ
	 eUSc4yT3klhfKta/WUE2H6JFkSBmkWII+Tk2BIes3e79vy6lP5QK4j67NLWQWjIUoJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e2l/Fhwm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694D606A31C;
	Tue, 17 Nov 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2l/Fhwm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431531F000C4;
	Tue, 17 Nov 2026 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916099;
	bh=hafnD3hdUTBG+I//74sAT7NVLzBxbLqlDm9QdAgelSE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e2l/FhwmqDsqIpOXc2DiDweTCvIlhO5eZxg80E5sDHB29tuj3bO2tpMuXpU2M0pgF
	 MNC1qPWbUL5ALiuPNHHCsdvWd3VvhWNbHERELXvj4ZRMiCQ/cy2mIgzBllGU+h5b0e
	 WN/mq09UhF96wCJhsFxXYljBBSJvbN5zyBLzo7ve2vWQ7qf8pE3REl6pb8TY0e0ZEw
	 yQrdK/TSWxZu6xn4BtH69TipnTwWuxBoioB/PT3jMqbFQXCGTfLoJ0CZhdOoIqUw5F
	 dRA4li7wOyQIPqhJGzlx+TXYyHA75mER4lbChkadnXqCIJbSiZnSKQwEjPzCLHxB/D
	 63YT9iaxj+1jw==
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liang Haowen <nbg2974@gmail.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104142415.676757-1-arnd@kernel.org>
References: <20261104142415.676757-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: asus-aura-scsi: add CONFIG_SCSI_DH
 dependency
Message-Id: <179491609700.90264.12365494305888968428.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:48:17 +0000
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

On Wed, 04 Nov 2026 14:20:56 +0100, Arnd Bergmann wrote:
> Without the device handler support, the driver fails to link:
> 
> ERROR: modpost: drivers/leds/rgb/leds-asus-aura-scsi.ko: symbol 'scsi_register_device_handler' undefined!
> 
> Add a Kconfig dependency to only show the symbol if it can
> be enabled.
> 
> [...]

Applied, thanks!

[1/1] leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
      commit: 1b5298e11965bbac7e903314db1789dc736a1668

--
Lee Jones [李琼斯]

