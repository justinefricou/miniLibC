/*
** EPITECH PROJECT, 2021
** B-ASM-400-TLS-4-1-asmminilibc-justine.fricou
** File description:
** libasm: header
*/

#ifndef LIBASM_H_
#define LIBASM_H_

#include <stddef.h>

size_t my_strlen(const char *s);
char *my_strchr(const char *s, int c);
void *my_memset(void *s, int c, size_t n);
void *my_memcpy(void *dest, const void *src, size_t n);
int my_strcmp(const char *s1, const char *s2);
int my_strncmp(const char *s1, const char *s2, size_t n);
int my_strcasecmp(const char *s1, const char *s2);
char *my_rindex(const char *s, int c);

#endif /* !LIBASM_H_ */
