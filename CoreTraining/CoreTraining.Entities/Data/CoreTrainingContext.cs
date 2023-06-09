﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CoreTraining.Entities.Data
{
    public partial class CoreTrainingContext : DbContext
    {
        public CoreTrainingContext()
        {
        }

        public CoreTrainingContext(DbContextOptions<CoreTrainingContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Posts> Posts { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<RoleClaims> RoleClaims { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserClaims> UserClaims { get; set; }
        public virtual DbSet<UserLogins> UserLogins { get; set; }
        public virtual DbSet<UserTokens> UserTokens { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Posts>(entity =>
            {
                entity.Property(e => e.Id).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CreatedUserId)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedUserId).HasMaxLength(100);

                entity.Property(e => e.Description).IsRequired();

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.UpdatedDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedUserId).HasMaxLength(100);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Name).HasMaxLength(256);

                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<RoleClaims>(entity =>
            {
                entity.Property(e => e.RoleId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.RoleClaims)
                    .HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedUserId)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedUserId).HasMaxLength(100);

                entity.Property(e => e.Dob)
                    .HasColumnType("datetime")
                    .HasColumnName("DOB");

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.LastName).HasMaxLength(100);

                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);

                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);

                entity.Property(e => e.ProfileName).HasMaxLength(50);

                entity.Property(e => e.TokenDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedUserId).HasMaxLength(100);

                entity.Property(e => e.UserName).HasMaxLength(256);

                entity.HasMany(d => d.RoleNavigation)
                    .WithMany(p => p.User)
                    .UsingEntity<Dictionary<string, object>>(
                        "UserRoles",
                        l => l.HasOne<Role>().WithMany().HasForeignKey("RoleId"),
                        r => r.HasOne<User>().WithMany().HasForeignKey("UserId"),
                        j =>
                        {
                            j.HasKey("UserId", "RoleId");

                            j.ToTable("UserRoles");
                        });
            });

            modelBuilder.Entity<UserClaims>(entity =>
            {
                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserClaims)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<UserLogins>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.ProviderKey).HasMaxLength(128);

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(450);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserLogins)
                    .HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<UserTokens>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.Name).HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserTokens)
                    .HasForeignKey(d => d.UserId);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}